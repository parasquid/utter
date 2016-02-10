# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utter/version'

Gem::Specification.new do |spec|
  spec.name          = "utter"
  spec.version       = Utter::VERSION
  spec.authors       = ["parasquid"]
  spec.email         = ["parasquid@gmail.com"]

  spec.summary       = %q{Easily allow any object to emits events.}
  spec.description   = %q{Utter provides a standard API to allow any class to
                          emit events. It abstracts away event queueing and
                          propagation so you don't have to worry about it.}
  spec.homepage      = "https://github.com/parasquid/utter"
  spec.license       = "LGPLv3"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec-given"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency 'gem_config', "0.3.1"
end
