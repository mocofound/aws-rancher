provider "rancher2" {
  api_url    = "https://rancher.my-domain.com"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
}
