# Docs: https://terraspace.cloud/docs/config/reference/
# frozen_string_literal: false

Terraspace.configure do |config|
  config.logger.level = :info
  config.allow.envs = ['dev', 'qa', 'prod', 'mgmt']
  config.allow.regions = ['europe-west1']
end
