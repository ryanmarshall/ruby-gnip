# -*- encoding: utf-8 -*-
#$:.push File.expand_path("../lib", __FILE__)
#require "gnip/version"

Gem::Specification.new do |s|
  s.name = %q{ruby-gnip}
  #s.version = Gnip::VERSION
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Marshall", "Vladimir Kolesnikov"]
  s.date = %q{2010-10-05}
  s.description = %q{Simple Ruby client library for twitter streaming API. Uses EventMachine for connection handling. Adheres to twitter's reconnection guidline. JSON format only.}
  s.summary = %q{Gnip realtime API client}
  s.homepage = %q{http://github.com/ryanmarshall/ruby-gnip}
  s.email = %q{rmarsh000@gmail.com}

  s.platform                  = Gem::Platform::RUBY
  s.rubygems_version          = %q{1.3.6}
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = ["README.markdown"]

  #s.add_runtime_dependency('eventmachine', "~> 1.0.0.beta.3")
  s.add_runtime_dependency('simple_oauth', '~> 0.1.4')
  s.add_runtime_dependency('httparty', '~> 0.7.7')
  s.add_development_dependency('rspec', "~> 2.5.0")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

