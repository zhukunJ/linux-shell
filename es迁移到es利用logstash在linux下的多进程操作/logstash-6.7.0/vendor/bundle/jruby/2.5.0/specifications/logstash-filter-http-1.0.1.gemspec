# -*- encoding: utf-8 -*-
# stub: logstash-filter-http 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "logstash-filter-http".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "logstash_group" => "filter", "logstash_plugin" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Elastic".freeze]
  s.date = "2019-02-06"
  s.description = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install logstash-filter-http. This gem is not a stand-alone program".freeze
  s.email = "info@elastic.co".freeze
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html".freeze
  s.licenses = ["Apache License (2.0)".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "This filter requests data from a RESTful Web Service.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<logstash-core-plugin-api>.freeze, ["<= 2.99", ">= 1.60"])
      s.add_runtime_dependency(%q<logstash-mixin-http_client>.freeze, ["< 9.0.0", ">= 5.0.0"])
      s.add_development_dependency(%q<logstash-devutils>.freeze, ["< 2.0.0", ">= 0"])
    else
      s.add_dependency(%q<logstash-core-plugin-api>.freeze, ["<= 2.99", ">= 1.60"])
      s.add_dependency(%q<logstash-mixin-http_client>.freeze, ["< 9.0.0", ">= 5.0.0"])
      s.add_dependency(%q<logstash-devutils>.freeze, ["< 2.0.0", ">= 0"])
    end
  else
    s.add_dependency(%q<logstash-core-plugin-api>.freeze, ["<= 2.99", ">= 1.60"])
    s.add_dependency(%q<logstash-mixin-http_client>.freeze, ["< 9.0.0", ">= 5.0.0"])
    s.add_dependency(%q<logstash-devutils>.freeze, ["< 2.0.0", ">= 0"])
  end
end
