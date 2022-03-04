module Terraspace::Project::CustomHelper
  def module_version
    file = "app/stacks/#{@mod.name}/tfvars/#{Terraspace.env}.tfvars"
    File.readlines(file).grep(/module_version/)[0].split(/=/, -1)[1].tr!('"','').strip
  end

  def region
    ENV['GOOGLE_REGION']
  end
end
