variable "app_name" {
  type        = string
  description = "(Infrastructure) Application Name"
  default     = "hsm"
}

variable "app_namespace" {
  type        = string
  description = "(Infrastructure) Application Namespace"
}

variable "tfenv" {
  type        = string
  description = "(Infrastructure) Environment"
}

variable "cluster_root_domain" {
  description = "Domain root where all kubernetes systems are orchestrating control"
  type        = string
}

variable "repository_secrets" {
  description = "Provisioning base repository secrets for ArgoCD"
  type = list(object({
    name          = string
    url           = string
    type          = string
    username      = string
    password      = string
    secrets_store = string
  }))
  default = []
}

variable "credential_templates" {
  description = "Provisioning credential templates for ArgoCD"
  type = list(object({
    name          = string
    url           = string
    username      = string
    password      = string
    secrets_store = string
  }))
  default = []
}

variable "registry_secrets" {
  description = "Provisioning secrets for ArgoCD to access Docker Registry Images"
  type = list(object({
    name          = string
    username      = string
    password      = string
    url           = string
    email         = string
    secrets_store = string
  }))
  default = []
}

# variable "generate_plugin_repository_secret" {
#   description = "[Depreciated] Generate a secret for ArgoCD to access Hex Trust-developed helm-env-subst-plugin image"
#   type        = bool
#   default     = false
# }

variable "additionalProjects" {
  description = "Default ArgoCD projects to be created upon platform provisioning"
  type = list(object({
    name        = string
    description = string
    clusterResourceWhitelist = list(object({
      group = string
      kind  = string
    }))
    destinations = list(object({
      name      = string
      namespace = string
      server    = string
    }))
    sourceRepos = list(string)
  }))
  default = []
}

variable "chart_version" {
  description = "ArgoCD chart version"
  default     = "5.51.4"
}

variable "custom_values" {
  description = "Custom values for ArgoCD"
  type        = string
  default     = ""
}

variable "application_sets" {
  description = "Default ArgoCD ApplicationSets for initial provisioning alongside ArgoCD"
  type = list(object({
    filepath = string
    envvars  = map(string)
  }))
  default = []
}

# variable "kms_key_id" {
#   default = ""
# }
