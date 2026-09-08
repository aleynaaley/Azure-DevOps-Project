variable "service_name" {
    type = string
}

variable "web_app_name" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "os_type" {
    type = string
    default = "Linux"
}