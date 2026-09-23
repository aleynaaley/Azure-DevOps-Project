terraform {
    source = "../../../modules/static-web-app"
}

include "root" {
    path = find_in_parent_folders("root.hcl")
}

dependency "rg" {
    config_path = "../resource_group"

    mock_outputs = {
        name = "rg-ocr-dev"
    }
    mock_outputs_allowed_terraform_commands = ["plan", "validate"]
} 

locals {
    app_config  = read_terragrunt_config(find_in_parent_folders("app.hcl"))
}

inputs = {
    name     = "swa-${local.app_config.locals.application_shortname}-dev"
    location = "eastus2"
    resource_group_name = dependency.rg.outputs.name
}

