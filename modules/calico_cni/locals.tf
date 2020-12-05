locals {
  calico_cni_config_default = {
    create_calico_cni = true            # Controls if calico_cni should be created (it affects almost all resources)
    pods_cidr         = "10.127.0.0/18" # CIDR to deploy pods in. Pod IPs will be chosen from this range
  }
  calico_cni_config = merge(
    local.calico_cni_config_default,
    var.calico_cni_config,
  )
}
