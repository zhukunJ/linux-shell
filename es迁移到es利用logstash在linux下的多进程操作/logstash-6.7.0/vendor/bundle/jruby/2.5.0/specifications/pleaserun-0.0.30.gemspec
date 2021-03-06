# -*- encoding: utf-8 -*-
# stub: pleaserun 0.0.30 ruby lib lib

Gem::Specification.new do |s|
  s.name = "pleaserun".freeze
  s.version = "0.0.30"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "lib".freeze]
  s.authors = ["Jordan Sissel".freeze]
  s.date = "2017-08-07"
  s.description = "pleaserun".freeze
  s.email = ["jls@semicomplete.com".freeze]
  s.executables = ["pleaserun".freeze, "please-manage-user".freeze]
  s.files = ["bin/please-manage-user".freeze, "bin/pleaserun".freeze]
  s.homepage = "https://github.com/jordansissel/pleaserun".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "pleaserun".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cabin>.freeze, ["> 0"])
      s.add_runtime_dependency(%q<clamp>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<stud>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mustache>.freeze, ["= 0.99.8"])
      s.add_runtime_dependency(%q<insist>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<dotenv>.freeze, [">= 0"])
    else
      s.add_dependency(%q<cabin>.freeze, ["> 0"])
      s.add_dependency(%q<clamp>.freeze, [">= 0"])
      s.add_dependency(%q<stud>.freeze, [">= 0"])
      s.add_dependency(%q<mustache>.freeze, ["= 0.99.8"])
      s.add_dependency(%q<insist>.freeze, [">= 0"])
      s.add_dependency(%q<dotenv>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<cabin>.freeze, ["> 0"])
    s.add_dependency(%q<clamp>.freeze, [">= 0"])
    s.add_dependency(%q<stud>.freeze, [">= 0"])
    s.add_dependency(%q<mustache>.freeze, ["= 0.99.8"])
    s.add_dependency(%q<insist>.freeze, [">= 0"])
    s.add_dependency(%q<dotenv>.freeze, [">= 0"])
  end
end
