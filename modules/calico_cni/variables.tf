variable "create_eks" {
  description = "Controls if EKS resources should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "create_calico_cni" {
  description = "Controls if calico_cni should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "calico_cni_config" {
  description = "Map of values to configure Calico CNI settings. See `calico_cni` module's documentaton for more details"
  type        = any
  default     = {}
}

# Hack for a homemade `depends_on` https://discuss.hashicorp.com/t/tips-howto-implement-module-depends-on-emulation/2305/2
# Will be removed in Terraform 0.13 with the support of module's `depends_on` https://github.com/hashicorp/terraform/issues/10462
variable "cni_depends_on" {
  description = "List of references to other resources this submodule depends on"
  type        = any
  default     = null
}
