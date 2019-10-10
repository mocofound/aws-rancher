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
