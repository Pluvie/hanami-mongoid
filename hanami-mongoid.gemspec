
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hanami/mongoid/version"

Gem::Specification.new do |spec|
  spec.name          = "hanami-mongoid"
  spec.version       = Hanami::Mongoid::VERSION
  spec.authors       = ["Francesco Ballardin"]
  spec.email         = ["francesco.ballardin@develonproject.com"]

  spec.summary       = %q{Adds repositories and wraps Mongoid methods for Hanami.}
  spec.description   = %q{Adds repositories and wraps Mongoid methods for Hanami.}
  spec.homepage      = "https://github.com/Pluvie/hanami-mongoid"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mongoid"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
end
