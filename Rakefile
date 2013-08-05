require 'rake'
require 'rake/clean'

task 'lib/css.rex' do |f|
  sh "rex --stub #{f}"
end

task 'lib/css.racc' do |f|
  sh "racc #{f}"
end

task :build => ['lib/css.racc', 'lib/css.rex']

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.test_files = FileList["test/test*.rb"]
  t.verbose = true
end

task :default => [:build, :test]
