# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{using}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Taylor"]
  s.date = %q{2009-06-14}
  s.description = %q{TODO}
  s.email = %q{scott@railsnewbie.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "GPL3.txt",
    "Rakefile",
    "VERSION.yml",
    "lib/using.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "spec/using_spec.rb"
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
    else
    end
  else
  end
end
