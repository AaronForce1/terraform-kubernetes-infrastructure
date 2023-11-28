locals {
  ## ARGOCD: LOCAL VARS FOR TERRAFORM EXPOSED TO ARGO BY DEFAULT
  argocd_applicationSet_clusterVars = {
    root_domain_name = var.cluster_root_domain,
  }
}
