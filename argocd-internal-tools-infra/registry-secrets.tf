resource "kubernetes_secret" "regcred" {
  for_each = { for regcred in coalesce(var.registry_secrets, []) : "${regcred.name}-argocd" => regcred }

  metadata {
    name      = "registry-${each.value.name}"
    namespace = "argocd"
    labels = {
      "app.kubernetes.io/part-of"    = "${var.app_name}-${var.app_namespace}-${var.tfenv}"
      "app.kubernetes.io/managed-by" = "Terraform"
    }
  }

  data = {
    ".dockerconfigjson" = sensitive(jsonencode({
      auths = {
        (each.value.url) = {
          "username" = each.value.username
          "password" = each.value.password
          "email"    = each.value.email
          "auth"     = base64encode("${each.value.username}:${each.value.password}")
        }
      }
    }))
  }

  type = "kubernetes.io/dockerconfigjson"
}
