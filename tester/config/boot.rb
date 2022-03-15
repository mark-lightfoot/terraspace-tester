# frozen_string_literal: false

file = 'config/terraform/tfvars/base.tfvars'
lines = File.readlines(file)
env_file = "config/terraform/tfvars/#{Terraspace.env}.tfvars"
env_lines = File.readlines(env_file) if File.file?(env_file)

base_region = lines.grep(/region/)[0]
env_region = env_lines.grep(/region/)[0] if File.file?(env_file)
region = base_region.split(/=/, -1)[1].tr!('"', '').strip
region = env_region.split(/=/, -1)[1].tr!('"', '').strip unless env_region.nil?

project = lines.grep(/project_factory_project/)[0].split(/=/, -1)[1].tr!('"', '').strip
ENV['GOOGLE_PROJECT'] = project
ENV['GOOGLE_REGION'] = region
# we ignore this because we assume an SA, there is just some
# weird initial race conditions we hit while assuming it via TF nicely
ENV['GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS'] = '1'
