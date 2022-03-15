# frozen_string_literal: false

# Helper across all modules
module Terraspace::Project::CustomHelper
  def module_version
    file = "app/stacks/#{@mod.name}/tfvars/#{Terraspace.env}.tfvars"
    File.readlines(file).grep(/^module_version *= *"?[\w .~=>]*"?$/)[0].split(/=/, -1)[1].tr!('"', '').strip
  end

  def module_version_spec(name)
    file = "app/stacks/#{@mod.name}/tfvars/#{Terraspace.env}.tfvars"
    File.readlines(file).grep(/^module_version_#{name} *= *"?[\w. ~=>]*"?$/)[0].split(/=/, -1)[1].tr!('"', '').strip
  end

  def region
    file = "app/stacks/#{@mod.name}/tfvars/#{Terraspace.env}.tfvars"
    envreg = File.readlines(file).grep(/^region *= *"?\w*-?\w*"?$/)[0]
    envreg.nil? ? ENV['GOOGLE_REGION'] : envreg.split(/=/, -1)[1].tr!('"', '').strip
  end

  def enforce_env(env)
    abort("Only `#{env}` is allowed for this stack!") if Terraspace.env != env
  end
end
