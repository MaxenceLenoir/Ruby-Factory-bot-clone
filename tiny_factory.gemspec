# frozen_string_literal: true

require_relative "lib/tiny_factory/version"

Gem::Specification.new do |spec|
  spec.name          = "tiny_factory"
  spec.version       = TinyFactory::VERSION
  spec.authors       = ["MaxenceLenoir"]
  spec.email         = ["maxence.lenoir1206@gmail.com"]

  spec.summary       = "Factory Bot Clone"
  spec.description   = "Factory Bot Clone"
  spec.homepage      = "https://google.com"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://google.com"
  spec.metadata["changelog_uri"] = "https://google.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_development_dependency("activerecord", "~> 6.1")
  spec.add_development_dependency("sqlite3", "~> 1.4.2")
  spec.add_dependency("activesupport", "~> 6.1")
end
