# frozen_string_literal: true

version = File.read(File.join(__dir__, 'VERSION')).strip

Gem::Specification.new do |s|
  s.name = 'identity-api-client'
  s.version = version
  s.authors = ['Nathan Woodhull', 'Owens Ehimen', 'Diego Marcet', 'Grey Moore']
  s.email = ['talk@controlshiftlabs.com']
  s.homepage = 'https://github.com/controlshift/identity-api-client'
  s.license = 'MIT'
  s.summary = 'Ruby client for the Identity API'
  s.description = 'API client for the Identity API'
  s.required_ruby_version = '>= 3.4.0'

  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(pkg|spec)/}) }
  end
  s.require_paths = ['lib']

  s.add_runtime_dependency 'vertebrae', '~> 2.0'

  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-byebug', '~> 3.4'
  s.add_development_dependency 'rdoc', '>= 6.3.1'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rubocop', '>= 0'
  s.add_development_dependency 'simplecov', '>= 0'
  s.add_development_dependency 'webmock', '~> 3.0', '>= 3.0.1'
end
