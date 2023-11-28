<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.12.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 2.0.3 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.applicationsets](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.argocd_project](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_secret.argocd_application_credential_template](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.argocd_application_repository_secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.regcred](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalProjects"></a> [additionalProjects](#input\_additionalProjects) | Default ArgoCD projects to be created upon platform provisioning | <pre>list(object({<br>    name        = string<br>    description = string<br>    clusterResourceWhitelist = list(object({<br>      group = string<br>      kind  = string<br>    }))<br>    destinations = list(object({<br>      name      = string<br>      namespace = string<br>      server    = string<br>    }))<br>    sourceRepos = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | (Infrastructure) Application Name | `string` | `"hsm"` | no |
| <a name="input_app_namespace"></a> [app\_namespace](#input\_app\_namespace) | (Infrastructure) Application Namespace | `string` | n/a | yes |
| <a name="input_application_sets"></a> [application\_sets](#input\_application\_sets) | Default ArgoCD ApplicationSets for initial provisioning alongside ArgoCD | <pre>list(object({<br>    filepath = string<br>    envvars  = map(string)<br>  }))</pre> | `[]` | no |
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | ArgoCD chart version | `string` | `"5.51.4"` | no |
| <a name="input_cluster_root_domain"></a> [cluster\_root\_domain](#input\_cluster\_root\_domain) | Domain root where all kubernetes systems are orchestrating control | `string` | n/a | yes |
| <a name="input_credential_templates"></a> [credential\_templates](#input\_credential\_templates) | Provisioning credential templates for ArgoCD | <pre>list(object({<br>    name          = string<br>    url           = string<br>    username      = string<br>    password      = string<br>    secrets_store = string<br>  }))</pre> | `[]` | no |
| <a name="input_custom_values"></a> [custom\_values](#input\_custom\_values) | Custom values for ArgoCD | `string` | `""` | no |
| <a name="input_registry_secrets"></a> [registry\_secrets](#input\_registry\_secrets) | Provisioning secrets for ArgoCD to access Docker Registry Images | <pre>list(object({<br>    name          = string<br>    username      = string<br>    password      = string<br>    url           = string<br>    email         = string<br>    secrets_store = string<br>  }))</pre> | `[]` | no |
| <a name="input_repository_secrets"></a> [repository\_secrets](#input\_repository\_secrets) | Provisioning base repository secrets for ArgoCD | <pre>list(object({<br>    name          = string<br>    url           = string<br>    type          = string<br>    username      = string<br>    password      = string<br>    secrets_store = string<br>  }))</pre> | `[]` | no |
| <a name="input_tfenv"></a> [tfenv](#input\_tfenv) | (Infrastructure) Environment | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
