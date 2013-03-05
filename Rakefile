# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "lazy_list"
  gem.homepage = "http://github.com/foxnewsnetwork/lazy_list"
  gem.license = "MIT"
  gem.summary = %Q{Ruby2.0 implementaiton of lazy lists as they were meant to be straight out of Structures and Interpretations of Computer Programs.}
  gem.description = %Q{Ruby is not Haskell. It is NOT a functional language and it isn't meant to be lazy, and forcing it to be anything other than Ruby is stupid and inefficient... but that didn't stop me from building an ultra-lazy Ruby2.0 version of the lazy list}
  gem.email = "foxnewsnetwork@gmail.com"
  gem.authors = ["Thomas Chen"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "lazy_list #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
