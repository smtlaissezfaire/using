require 'spec/rake/spectask'
require 'spec/rake/verify_rcov'
require 'hanna/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "using"
    s.summary     = "Ruby File loading made easy"
    s.email       = "scott@railsnewbie.com"
    s.homepage    = "http://github.com/smtlaissezfaire/using"
    s.authors     = ["Scott Taylor"]
    s.description = <<-DESC
      Flexibly load ruby files.
       
      This gem will automatically add File.expand_path(File.dirname(__FILE__) + "/my_mod/my_file")
      with a simple declaration.  Uses non-obtrusive methods - it won't polute Object
      or Kernel (although you are free to, if you so choose).
       
      This also allows you to switch between require, load, and autoload on a project wide basis.
    DESC
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

def doc_directory
  "doc"
end

def create_doc_directory
  unless File.exists?(doc_directory)
    `mkdir doc`
  end  
end

task :create_doc_directory do
  create_doc_directory
end

desc 'Run the specs'
Spec::Rake::SpecTask.new do |t|
  t.warning = false
  t.spec_opts = ["--color"]
end

desc "Create the html specdoc"
Spec::Rake::SpecTask.new(:specdoc => :create_doc_directory) do |t|
  t.spec_opts = ["--format", "html:doc/specdoc.html"]
end

desc 'Generate RDoc.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = doc_directory
  rdoc.title    = 'Using'
  rdoc.options << '--line-numbers' << '--inline-source'

  rdoc.options << '--webcvs=http://github.com/mislav/will_paginate/tree/master/'

  ["README.rdoc", "GPL3.txt", "MIT_LICENSE", "lib/**/*.rb"].each do |file|
    rdoc.rdoc_files.include(file)
  end
end

desc 'Create the specdoc + rdoc'
task :build_docs => [:rerdoc, :specdoc, :rcov, :flog_to_disk]

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new(:rcov) do |t|
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
  t.rcov_dir = "doc/rcov"
end

desc "Feel the pain of my code, and submit a refactoring patch"
task :flog do
  puts %x(find lib | grep ".rb$" | xargs flog)
end

task :flog_to_disk => :create_doc_directory do
  puts "Flogging..."
  %x(find lib | grep ".rb$" | xargs flog > doc/flog.txt)
  puts "Done Flogging...\n"
end
