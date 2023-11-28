resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = false
  version          = var.chart_version

  ## Default values.yaml + configuration
  ## https://github.com/argoproj/argo-helm/blob/master/charts/argo-cd/values.yaml
  values = coalesce([var.custom_values, <<EOT
server:
  env:
    - name: ARGOCD_API_SERVER_REPLICAS
      value: '1'
  ingress:
    enabled: true
    ingressClassName: nginx
    hosts:
      - argocd.${var.cluster_root_domain}
  extraArgs:
    - --insecure
EOT
  ])

  # dynamic "set" {
  #   for_each = var.custom_manifest.extra_values
  #   content {
  #     name  = set.key
  #     value = set.value
  #     type  = "auto"
  #   }
  # }

  #  set {
  #    name  = "repoServer.serviceAccount.annotations"
  #    value = var.custom_manifest.kma_arn != null ? var.custom_manifest.kma_arn : "chart: argo-cd"
  #  }
}

resource "kubectl_manifest" "applicationsets" {
  for_each = { for applicationSet in try(var.application_sets, []) : regex("([A-Za-z0-9-]+).yaml", applicationSet.filepath)[0] => applicationSet }
  depends_on = [
    helm_release.argocd
  ]

  yaml_body = templatefile(
    each.value.filepath,
    merge(each.value.envvars, local.argocd_applicationSet_clusterVars)
  )
}
