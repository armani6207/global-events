require_relative 'lib/global_events/version'

Gem::Specification.new do |spec|
  spec.name          = "global_events"
  spec.version       = GlobalEvents::VERSION
  spec.authors       = ["Armando"]
  spec.email         = ["rojas.armani@gmail.com"]

  spec.summary       = %q{Find out about natural events happening around the globe. (Uses NASA's EONET API.)}
  spec.homepage      = "https://github.com/armani6207/global-events"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/armani6207/global-events"
  spec.metadata["changelog_uri"] = "https://github.com/armani6207/global-events"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
