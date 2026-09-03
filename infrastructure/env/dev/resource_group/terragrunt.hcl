terraform {
    source = "../../../modules/resource-group"
}

inputs = {
    name     = "rg-ocarina-dev"
    location = "westeurope"
}
