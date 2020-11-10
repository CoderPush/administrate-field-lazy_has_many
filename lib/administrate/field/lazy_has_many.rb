require 'administrate/field/has_many'
require "administrate/field/lazy_has_many/version"
require 'rails/engine'
require 'administrate/engine'

module Administrate
  module Field
    class LazyHasMany < Administrate::Field::HasMany
      include LazyHasManyVersion

      class Error < StandardError; end
      class Engine < ::Rails::Engine
        Administrate::Engine.add_javascript 'administrate-field-lazy_has_many/application'
        Administrate::Engine.add_stylesheet 'administrate-field-lazy_has_many/application'

        isolate_namespace Administrate
      end

      def templated_action
        options.fetch(:action).call(self, q: '{q}')
      end

      def value_attribute
        options.fetch(:value_attribute) { 'id' }
      end

      def label_attribute
        options.fetch(:label_attribute) { 'name' }
      end

      def current_values
        data || [display_placeholder]
      end

      def size
        options.fetch(:size) { 10 }
      end

      def display_placeholder
        options.fetch(:placeholder) do
          format('Select a %<association>s', association: associated_class.name)
        end
      end

      private
      def candidate_resources
        scope = options[:scope] ? options[:scope].call(self) : associated_class.all
        scope = scope.includes(*options.fetch(:includes)) if options.key?(:includes)

        order = options.delete(:order)
        order ? scope.reorder(order) : scope
      end
    end
  end
end
