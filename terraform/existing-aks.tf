resource "azurerm_kubernetes_cluster" "existing_aks" {
  name                = "jaidevopsaks"
  location            = "centralindia"
  resource_group_name = "rg-devops-e2e"
  dns_prefix          = "jaidevopsaks-dns"

  kubernetes_version        = "1.35.8"
  automatic_upgrade_channel = "patch"

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  image_cleaner_enabled        = true
  image_cleaner_interval_hours = 168

  node_os_upgrade_channel = "NodeImage"

  sku_tier     = "Free"
  support_plan = "KubernetesOfficial"

  default_node_pool {
    name         = "akspool"
    node_count   = 1
    vm_size      = "Standard_D4s_v5"
    os_disk_type = "Managed"

    os_disk_size_gb = 128
    os_sku          = "Ubuntu"
    max_pods        = 110

    zones = ["2"]

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"

    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"

    pod_cidr       = "10.244.0.0/16"
    service_cidr   = "10.0.0.0/16"
    dns_service_ip = "10.0.0.10"

    ip_versions = ["IPv4"]
  }

  maintenance_window_auto_upgrade {
    frequency   = "Weekly"
    interval    = 1
    duration    = 8
    day_of_week = "Sunday"
    start_time  = "00:00"
    utc_offset  = "+00:00"
    start_date  = "2026-09-21T00:00:00Z"
  }

  maintenance_window_node_os {
    frequency   = "Weekly"
    interval    = 1
    duration    = 8
    day_of_week = "Sunday"
    start_time  = "00:00"
    utc_offset  = "+00:00"
    start_date  = "2026-09-21T00:00:00Z"
  }
}