output "worker_private" {
  value = module.compute_instance.worker_private
}

output "nfs_private" {
  value = module.compute_instance.nfs_private
}

output "manager_public" {
  value = module.compute_instance.manager_public
}
