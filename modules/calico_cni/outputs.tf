output "helm_deployment_metadata" {
  description = "Helm release metadata"
  value       = element(concat(helm_release.calico_cni[*].metadata, list("")), 0)
}
