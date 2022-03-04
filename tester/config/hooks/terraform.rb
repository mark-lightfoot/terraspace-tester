# class TokenCreator
#   def call
#     file = "config/terraform/tfvars/base.tfvars"
#     lines = File.readlines(file)
#     sa =  lines.grep(/service_account/)[0].split(/=/, -1)[1].tr!('"','').strip
#     cmd = `export GOOGLE_OAUTH_ACCESS_TOKEN=$(create-token -s #{sa})`
#   end
# end

# before("init", "plan", "apply",
#   execute: TokenCreator,
# )

# after("apply",
#   execute: "echo 'config/hooks/terraform.rb: test project after hook for terraform apply'"
# )
