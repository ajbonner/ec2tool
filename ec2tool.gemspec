Gem::Specification.new do |s|
  s.name        = 'ec2tool'
  s.version     = '0.1.0'
  s.summary     = 'Utility to manage amazon EC2 instances'
  s.description = %q{EC2Tool is a thin wrapper around the amazon aws-sdk to 
                     allow the easy start and stop of ec2 instances}
  s.license     = "MIT"
  s.authors     = ["Aaron Bonner"]
  s.email       = 'ajbonner@gmail.com'
  s.homepage    = 'https://github.com/ajbonner/ec2tool'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'aws-sdk'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
end
