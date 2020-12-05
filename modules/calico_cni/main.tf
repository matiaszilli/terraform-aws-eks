resource "helm_release" "calico_cni" {
  count      = var.create_calico_cni && var.create_eks ? 1 : 0
  name       = "calico-cni"
  repository = "${path.module}/charts"
  chart      = "calico-cni"
  namespace  = "kube-system"
  version    = "1.0.0"
  wait       = false
  replace    = true

  set {
    name = "podsCidr"
    value = lookup(
      local.calico_cni_config,
      "pods_cidr"
    )
  }

  depends_on = [var.cni_depends_on]
}
