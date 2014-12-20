lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_robot_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = 'toy_robot_simulator'
  spec.version       = ToyRobotSimulator::VERSION
  spec.authors       = ['Aelphy (Usvyatsov Mikhail)']
  spec.email         = ['m.usvyatsov@gmail.com']
  spec.summary       = 'test task'
  spec.description   = 'Command line utility toy robot simulation'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- spec/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7.9'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
end
