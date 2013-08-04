require 'rake'
require 'rake/clean'

task 'lib/css.rex' do |f|
  sh "rex --stub #{f}"
end

file 'lib/css.racc' do |f|
  sh "racc #{f}"
end

task :default => ['lib/css.racc', 'lib/css.rex']
