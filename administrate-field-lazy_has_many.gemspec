require_relative 'lib/administrate/field/lazy_has_many/version'

Gem::Specification.new do |spec|
  spec.name          = "administrate-field-lazy_has_many"
  spec.version       = Administrate::Field::LazyHasMany::VERSION
  spec.authors       = ["Harley Trung"]
  spec.email         = ["harley@coderpush.com"]

  spec.summary       = %q{When you have way too many records in has_many and want to lazily load the relation in dropdown.}
  spec.homepage      = "https://github.com/CoderPush/administrate-field-lazy_has_many"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/CoderPush/administrate-field-lazy_has_many"
  spec.metadata["changelog_uri"] = "https://github.com/CoderPush/administrate-field-lazy_has_many/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
