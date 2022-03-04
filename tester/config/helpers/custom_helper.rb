module Terraspace::Project::CustomHelper
  def module_version
    file = "app/stacks/#{@mod.name}/tfvars/#{Terraspace.env}.tfvars"
    File.readlines(file).grep(/module_version/)[0].split(/=/, -1)[1].tr!('"','').strip
  end

  def region
    file = "app/stacks/#{@mod.name}/tfvars/#{Terraspace.env}.tfvars"
    reg = File.readlines(file).grep(/^region ?="?\w*-?\w*"?$/)[0]
    ret = ENV['GOOGLE_REGION']
    ret = reg.split(/=/, -1)[1].tr!('"','').strip if reg != nil
    ret
  end
end
