provider "rancher2" {
  #api_url    = "https://rancher.my-domain.com"
  #access_key = "${var.rancher2_access_key}"
  #secret_key = "${var.rancher2_secret_key}"
}

# Create a new rancher2 imported Cluster
resource "rancher2_cluster" "foo-imported" {
  name = "foo-imported"
  description = "Foo rancher2 imported cluster"
}

# Create a new rancher2 RKE Cluster
resource "rancher2_cluster" "foo-custom" {
  name = "foo-custom"
  description = "Foo rancher2 custom cluster"
  rke_config {
    network {
      plugin = "canal"
    }
  }
  enable_cluster_monitoring = true
  cluster_monitoring_input {
    answers = {
      "exporter-kubelets.https" = true
      "exporter-node.enabled" = true
      "exporter-node.ports.metrics.port" = 9796
      "exporter-node.resources.limits.cpu" = "200m"
      "exporter-node.resources.limits.memory" = "200Mi"
      "grafana.persistence.enabled" = false
      "grafana.persistence.size" = "10Gi"
      "grafana.persistence.storageClass" = "default"
      "operator.resources.limits.memory" = "500Mi"
      "prometheus.persistence.enabled" = "false"
      "prometheus.persistence.size" = "50Gi"
      "prometheus.persistence.storageClass" = "default"
      "prometheus.persistent.useReleaseName" = "true"
      "prometheus.resources.core.limits.cpu" = "1000m",
      "prometheus.resources.core.limits.memory" = "1500Mi"
      "prometheus.resources.core.requests.cpu" = "750m"
      "prometheus.resources.core.requests.memory" = "750Mi"
      "prometheus.retention" = "12h"
    }
  }
}
