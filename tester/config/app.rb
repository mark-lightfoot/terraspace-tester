# Docs: https://terraspace.cloud/docs/config/reference/
Terraspace.configure do |config|
  config.logger.level = :info
  config.allow.envs = ["dev", "qa", "prod"]
  config.allow.regions = ["europe-west1"]
end
