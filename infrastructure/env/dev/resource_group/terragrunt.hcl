terraform {
    source = "../../../modules/resource-group"
}

include "root" {
    path = find_in_parent_folders("root.hcl")
}

locals {
    app_config  = read_terragrunt_config(find_in_parent_folders("app.hcl"))
}

// name = "rg-ocarina-dev"
inputs = {
    name     = "rg-${local.app_config.locals.application_shortname}-dev"
    location = "westeurope"
}
