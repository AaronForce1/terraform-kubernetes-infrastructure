resource "kubernetes_secret" "argocd_application_repository_secrets" {
  for_each = {
    for repository_secret in var.repository_secrets : repository_secret.name => repository_secret
  }

  metadata {
    name      = "repository-${each.value.name}"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
      "app.kubernetes.io/part-of"      = "${var.app_name}-${var.app_namespace}-${var.tfenv}"
      "app.kubernetes.io/managed-by"   = "Terraform"
    }
  }

  data = {
    name     = each.value.name
    url      = each.value.url
    type     = each.value.type
    username = each.value.username
    password = each.value.password
  }
}
