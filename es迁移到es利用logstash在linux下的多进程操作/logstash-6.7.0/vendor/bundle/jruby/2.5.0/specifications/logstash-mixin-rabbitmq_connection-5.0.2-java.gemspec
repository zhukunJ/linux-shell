# -*- encoding: utf-8 -*-
# stub: logstash-mixin-rabbitmq_connection 5.0.2 java lib

Gem::Specification.new do |s|
  s.name = "logstash-mixin-rabbitmq_connection".freeze
  s.version = "5.0.2"
  s.platform = "java".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Elastic".freeze]
  s.date = "2018-01-22"
  s.description = "This gem is a Logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install gemname. This gem is not a stand-alone program".freeze
  s.email = "info@elastic.co".freeze
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html".freeze
  s.licenses = ["Apache License (2.0)".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Common functionality for RabbitMQ plugins".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<march_hare>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<stud>.freeze, ["~> 0.0.22"])
      s.add_development_dependency(%q<logstash-devutils>.freeze, [">= 0"])
      s.add_development_dependency(%q<logstash-input-generator>.freeze, [">= 0"])
      s.add_development_dependency(%q<logstash-codec-json>.freeze, [">= 0"])
    else
      s.add_dependency(%q<march_hare>.freeze, ["~> 3.0"])
      s.add_dependency(%q<stud>.freeze, ["~> 0.0.22"])
      s.add_dependency(%q<logstash-devutils>.freeze, [">= 0"])
      s.add_dependency(%q<logstash-input-generator>.freeze, [">= 0"])
      s.add_dependency(%q<logstash-codec-json>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<march_hare>.freeze, ["~> 3.0"])
    s.add_dependency(%q<stud>.freeze, ["~> 0.0.22"])
    s.add_dependency(%q<logstash-devutils>.freeze, [">= 0"])
    s.add_dependency(%q<logstash-input-generator>.freeze, [">= 0"])
    s.add_dependency(%q<logstash-codec-json>.freeze, [">= 0"])
  end
end
