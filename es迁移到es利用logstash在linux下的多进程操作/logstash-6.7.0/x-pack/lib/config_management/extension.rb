# Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
# or more contributor license agreements. Licensed under the Elastic License;
# you may not use this file except in compliance with the Elastic License.

require "logstash/environment"
require "config_management/hooks"
require "config_management/elasticsearch_source"
require "config_management/bootstrap_check"

module LogStash
  module ConfigManagement
    class Extension < LogStash::UniversalPlugin
      include LogStash::Util::Loggable

      def register_hooks(hooks)
        require "logstash/runner"
        hooks.register_hooks(LogStash::Runner, Hooks.new)
      end

      def additionals_settings(settings)
        require "logstash/runner"
        logger.trace("Registering additionals settings")

        settings.register(LogStash::Setting::Boolean.new("xpack.management.enabled", false))
        settings.register(LogStash::Setting::TimeValue.new("xpack.management.logstash.poll_interval", "5s"))
        settings.register(LogStash::Setting::ArrayCoercible.new("xpack.management.pipeline.id", String, ["main"]))
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.username", "logstash_system"))
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.password"))

        # .url changed to .hosts in 7.0. In 6.7+ .url is still accepted but with a deprecation warning in Runner
        settings.register(LogStash::Setting::ArrayCoercible.new("xpack.management.elasticsearch.url", String, [ "https://localhost:9200" ] ))
        settings.register(LogStash::Setting::ArrayCoercible.new("xpack.management.elasticsearch.hosts", String, [ "https://localhost:9200" ] ))

        # .ca changed to .certificate_authority in 7.0. In 6.7+ .ca is still accepted but with a deprecation warning in Runner
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.ssl.ca"))
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.ssl.certificate_authority"))

        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.ssl.truststore.path"))
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.ssl.truststore.password"))
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.ssl.keystore.path"))
        settings.register(LogStash::Setting::NullableString.new("xpack.management.elasticsearch.ssl.keystore.password"))
        settings.register(LogStash::Setting::String.new("xpack.management.elasticsearch.ssl.verification_mode", "certificate", true, ["none", "certificate"]))
        settings.register(LogStash::Setting::Boolean.new("xpack.management.elasticsearch.sniffing", false))
      rescue => e
        logger.error("Cannot register new settings", :message => e.message, :backtrace => e.backtrace)
        raise e
      end
    end
  end
end
