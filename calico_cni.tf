locals {
  create_calico_cni = lookup(var.calico_cni_config, "create_calico_cni", true)
}

module "calico_cni" {
  source            = "./modules/calico_cni"
  create_eks        = var.create_eks
  create_calico_cni = local.create_calico_cni
  calico_cni_config = var.calico_cni_config

  # Hack to ensure ordering of resource creation.
  # This is a homemade `depends_on` https://discuss.hashicorp.com/t/tips-howto-implement-module-depends-on-emulation/2305/2
  # Do not create node_groups before other resources are ready and removes race conditions
  # Ensure these resources are created before "unlocking" the data source.
  # Will be removed in Terraform 0.13
  cni_depends_on = [
    aws_eks_cluster.this,
    null_resource.wait_for_cluster[0]
  ]
}
