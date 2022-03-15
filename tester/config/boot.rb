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
# we ignore this because we assume an SA, there is just some weird initial race conditions we hit while assuming it via TF nicely
ENV['GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS'] = "1"
