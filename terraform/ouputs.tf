output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "Resource ID of the Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "acr_login_server"{
    description = "Login server of the Azure Container Registry"
    value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.existing_aks.name
}