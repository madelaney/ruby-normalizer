# encoding: utf-8
# frozen_string_literal: true
# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__), 'lib', 'normalizer', 'version.rb'])
Gem::Specification.new do |s|
  s.name = 'ruby-normalizer'
  s.version = Version::VERSION
  s.author = 'Mike Delaney'
  s.email = 'github@mldelaney.com'
  s.homepage = 'http://github.com/madelaney/ruby-normalizer'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A simple ruby class that searchers for place holders and inserts environment variable values in their place.'
  s.files = Dir['**/*.rb']
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc', 'ruby-normalizer.rdoc']
  s.rdoc_options << '--title' << 'ruby-normalizer' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'normalize'
end
