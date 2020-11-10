require "administrate/field/lazy_has_many/version"

module Administrate
  module Field
    module LazyHasMany < Administrate::Field::HasMany
      class Error < StandardError; end
    end
  end
end
