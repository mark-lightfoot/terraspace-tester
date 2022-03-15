# frozen_string_literal: false

# Fail out run if not correct env
module Terraspace::Stack::ArtifactRegistry::EnvHelper
  abort('Only `mgmt` is allowed for this stack!') if Terraspace.env != 'mgmt'
end
