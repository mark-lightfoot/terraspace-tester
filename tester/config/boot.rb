file = "config/terraform/tfvars/base.tfvars"
lines = File.readlines(file)
envfile = "config/terraform/tfvars/#{Terraspace.env}.tfvars"
envlines = File.readlines(envfile)


baseRegion = lines.grep(/region/)[0]
envRegion = envlines.grep(/region/)[0]
region = baseRegion.split(/=/, -1)[1].tr!('"','').strip
region = envRegion.split(/=/, -1)[1].tr!('"','').strip if envRegion != nil

project = lines.grep(/project_factory_project/)[0].split(/=/, -1)[1].tr!('"','').strip
ENV['GOOGLE_PROJECT'] = project
ENV['GOOGLE_REGION'] = region

# sa =  lines.grep(/service_account/)[0].split(/=/, -1)[1].tr!('"','').strip
# ENV['GOOGLE_IMPERSONATE_SERVICE_ACCOUNT'] = sa
# cmd = `export GOOGLE_OAUTH_ACCESS_TOKEN=$(create-token -s #{sa})`
