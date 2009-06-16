# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{using}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Taylor"]
  s.date = %q{2009-06-16}
  s.description = %q{      Flexibly load ruby files.
       
      This gem will automatically add File.expand_path(File.dirname(__FILE__) + "/my_mod/my_file")
      with a simple declaration.  Uses non-obtrusive methods - it won't polute Object
      or Kernel (although you are free to, if you so choose).
       
      This also allows you to switch between require, load, and autoload on a project wide basis.
}
  s.email = %q{scott@railsnewbie.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "GPL3.txt",
     "MIT_LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/using.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/using_spec.rb",
     "using.gemspec"
  ]
  s.homepage = %q{http://github.com/smtlaissezfaire/using}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Ruby File loading made easy}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/using_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<facets>, [">= 0"])
    else
      s.add_dependency(%q<facets>, [">= 0"])
    end
  else
    s.add_dependency(%q<facets>, [">= 0"])
  end
end
