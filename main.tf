provider "rancher2" {
  #api_url    = "https://rancher.my-domain.com"
  #access_key = "${var.rancher2_access_key}"
  #secret_key = "${var.rancher2_secret_key}"
}

resource "rancher2_cluster" "quickstart" {
      annotations = {
       "authz.management.cattle.io/creator-role-bindings" = jsonencode(
                {
                created  = [
                   "cluster-owner",
                    ]
                 required = [
                    "cluster-owner",
                    ]
                }
            )
          "lifecycle.cattle.io/create.cluster-agent-controller-cleanup" = "true"
          "lifecycle.cattle.io/create.cluster-provisioner-controller"   = "true"
          "lifecycle.cattle.io/create.cluster-scoped-gc"                = "true"
          "lifecycle.cattle.io/create.mgmt-cluster-rbac-remove"         = "true"
         "provisioner.cattle.io/ke-driver-update"                      = "updated"
        }
      cluster_registration_token = [
          {
              annotations          = {}
              cluster_id           = "c-gvsf9"
              command              = "kubectl apply -f https://100.26.182.116/v3/import/mnlngbjl2xrj9kntnfcqhf286p2x4d979mmcczf95hffc7qlhvmn6j.yaml"
              id                   = "c-gvsf9:system"
              insecure_command     = "curl --insecure -sfL https://100.26.182.116/v3/import/mnlngbjl2xrj9kntnfcqhf286p2x4d979mmcczf95hffc7qlhvmn6j.yaml | kubectl apply -f -"
              labels               = {
                  "cattle.io/creator" = "norman"
                }
              manifest_url         = "https://100.26.182.116/v3/import/mnlngbjl2xrj9kntnfcqhf286p2x4d979mmcczf95hffc7qlhvmn6j.yaml"
              name                 = "system"
              node_command         = "sudo docker run -d --privileged --restart=unless-stopped --net=host -v /etc/kubernetes:/etc/kubernetes -v /var/run:/var/run rancher/rancher-agent:v2.3.0 --server https://100.26.182.116 --token mnlngbjl2xrj9kntnfcqhf286p2x4d979mmcczf95hffc7qlhvmn6j --ca-checksum 7b2f1057c6334f0fb40f7be09473ff3a1b68bcae2d03ae1da5969706e053f261"
              token                = "mnlngbjl2xrj9kntnfcqhf286p2x4d979mmcczf95hffc7qlhvmn6j"
              windows_node_command = "PowerShell -NoLogo -NonInteractive -Command \"& {docker run -v c:/:c:/host rancher/rancher-agent:v2.3.0 bootstrap --server https://100.26.182.116 --token mnlngbjl2xrj9kntnfcqhf286p2x4d979mmcczf95hffc7qlhvmn6j --ca-checksum 7b2f1057c6334f0fb40f7be09473ff3a1b68bcae2d03ae1da5969706e053f261 | iex}\""
            },
        ] 
      default_project_id         = "c-gvsf9:p-5sfmm" 
      docker_root_dir            = "/var/lib/docker" 
      driver                     = "rancherKubernetesEngine" 
      enable_cluster_alerting    = false 
      enable_cluster_istio       = false 
      enable_cluster_monitoring  = false 
      enable_network_policy      = false 
      id                         = "c-gvsf9" 
      #kube_config               = 
      #kube_config                = "apiVersion: v1\nkind: Config\nclusters:\n- name: \"quickstart\"\n  cluster:\n    server: \"https://100.26.182.116/k8s/clusters/c-gvsf9\"\n    certificate-authority-data: \"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM3akNDQ\\\n      WRhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFvTVJJd0VBWURWUVFLRXdsMGFHVXQKY\\\n      21GdVkyZ3hFakFRQmdOVkJBTVRDV05oZEhSc1pTMWpZVEFlRncweE9URXdNVFF4TlRNd01EWmFGd\\\n      zB5T1RFdwpNVEV4TlRNd01EWmFNQ2d4RWpBUUJnTlZCQW9UQ1hSb1pTMXlZVzVqYURFU01CQUdBM\\\n      VVFQXhNSlkyRjBkR3hsCkxXTmhNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ\\\n      0tDQVFFQXdPR0dYV0t0bEhhd1lOYUwKV0FmT2E5VWlHOXd5MXNnSkZEdlJyVEhQc21ZczFEZng2U\\\n      1N4MHZiQVhDb09vb3E2NEVkVmsrdWFxcnhDbnJvTwoxZVRyUERudFdyaGZmSEUzNHMxMk5qeVJkR\\\n      1Z5b3A4NDdodjhwQng1dWp0THdtOHdCWmxhOVlBUTZlaW5VOHU1Cm04UVVuaW9QUjNtUDZWKzdOZ\\\n      k9kUVFYWnZ4VStiZU50N1Jlcm9haWhDNjl2N2NGSFp1SnBxREJDTGlaWHhWcWkKNWMwc0tGNGZ3Z\\\n      mNHV04zbk4vR3hMYVpsbENoNTF2MnlZWE1BbENvM0lKUHVLVWNzenNPU2FCcjNHcXl1b1JxNQo5V\\\n      0trdDd4M1RKdlZYNTV1Z1BBSElHSURFWWt5QWkweTVEN0N4ejhMcDhwdW9zN0JGOHEreDBWYWVyZ\\\n      zFLbnFaCndHZENsd0lEQVFBQm95TXdJVEFPQmdOVkhROEJBZjhFQkFNQ0FxUXdEd1lEVlIwVEFRS\\\n      C9CQVV3QXdFQi96QU4KQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVBckE4L3VlLzVzM3ZsM3lvVmtvL\\\n      1V4cnJQMXQwQ0pBVHh4ZnFPaXNXbQpzWkRkUzN6cVNuY29qeFdaSzFKQkdQSWRrWFhwTDQrQmI3T\\\n      DhqZXFaV0xURzNpWW84d2JpTmJmVFd6STdXTU8wCk15cXlCTkpnMFI0OHhpc2pFMnZISUNkN2pDM\\\n      204NFZQZUNQenFhRmsra2xpNnkwSDZyaVZwaHVZTUJuWVdrTWgKOTBYTmFwOG5iNFRFYm5pMWpOY\\\n      1JpSjhpeFdzaTgyNWVNSHg1YjJwdFNMVktCeS8yVEcxWEQxeGJ1cW9HQld1YQpvK1l2d0xCNGVYN\\\n      VBUa2o0UmNYaUR4UHEwVTg5VUZPQmdqQkZoVHZFU2NCNlN3V1prOXR3eHJBbE01R3h5WTBlCnRPU\\\n      XVGVnZHMUQ0ZFMrdEx5c00rbVRzV1EwQkdqQWFGTTRqMFhub0xVeVE2NEE9PQotLS0tLUVORCBDR\\\n      VJUSUZJQ0FURS0tLS0t\"\n- name: \"quickstart-ahar-rancheragent-0-all\"\n  cluster:\n    server: \"https://3.231.226.54:6443\"\n    certificate-authority-data: \"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN3akNDQ\\\n      WFxZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFTTVJBd0RnWURWUVFERXdkcmRXSmwKT\\\n      FdOaE1CNFhEVEU1TVRBeE5ERTFNekF6TjFvWERUSTVNVEF4TVRFMU16QXpOMW93RWpFUU1BNEdBM\\\n      VVFQXhNSAphM1ZpWlMxallUQ0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ\\\n      0VCQU1kbE1vUnh5bzlZCkFuVlVDNWhSMnVMUGhYMzBjM2JJVzJrcGhYdmx0R3E2a1hMUEh6bUxRM\\\n      jFzRndSRWhudW0rRktFQ3RuaUZuOWMKaVdIalpSYTBIN1kxV0g2OFNFcG9sRDJmVGJyRVAwQjZ2a\\\n      2loYXlFbEFLa3NZbDhiNUdySk9QV3RId1N4Zzh6YQphcWM0cjkxS2tUWmhTK3liblBoWSt6ZVE5N\\\n      HY1Mk0zck04M3A5RU1XN21oS1JvOFJLOFlqdUtYaUk4Tzl5Z3h6CjBBTVQrVUt0NktnamluZCtlZ\\\n      UFzWWZBdENkV2w4d1NKdjVGN3BxOVlQcS9hOG92RDU0bU55SGtYcVo1VTQ2di8KRE42c2NjajYyb\\\n      zM1eDVHd3Y1WUFHNGE2N3JRRWthdnQ5Mk9iSGs1WWtkOW1hK0J3TjF6VWpHaFlnajFZcTAzQgpNM\\\n      StHbnRDWVU5c0NBd0VBQWFNak1DRXdEZ1lEVlIwUEFRSC9CQVFEQWdLa01BOEdBMVVkRXdFQi93U\\\n      UZNQU1CCkFmOHdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRDN4ekV4RCs5KzNQNkR2a25KVStDO\\\n      WI3bkFrUTBHUUhjYWkKNmhEL1BIMzhvM05oTXlvVzBhdFBsL01ZUkFaZFNCeDV5N3hZdVY0dnNvc\\\n      URlRGVhZGtkcUtKZlh2QU5VSnJJcwp0SnJHUzRrZVdjREtGWHE4eFdRZkdIdVVnTmE0Z3V3YjRVM\\\n      HhhbGtsZ3B1RktCbGxhMmNSY25OVUcyVDR3SllVCnpqcTAzUDZsRVJKM3gvYjBUbXRQUDcvWGdEN\\\n      UlKb2NYclQxTnNiUU9XRDZCSWFpb2ZHU1Vta1lXb1ZGbjJOM3kKbUZyNG41LzhBVjdlNmUwVnVIV\\\n      mtURlVsS3dLZXFMemx2ZE56Wld2RWxLZmFKK2kyWXR5OHU1VkVUTnRIZ1UrSwpRU2pydm1ZaitCV\\\n      mVTNXlqeGVjOWtKYUxOYVFrUkwvSWlIMEZtNTZiZXJBeXNDRUJhVDA9Ci0tLS0tRU5EIENFUlRJR\\\n      klDQVRFLS0tLS0K\"\n\nusers:\n- name: \"quickstart\"\n  user:\n    token: \"kubeconfig-user-gx4n8.c-gvsf9:tv5t6svsfmjwcvvnm8nqzqhbdn2vbqq6zxr52lfdlxzp8hm5w5ksvq\"\n\ncontexts:\n- name: \"quickstart\"\n  context:\n    user: \"quickstart\"\n    cluster: \"quickstart\"\n- name: \"quickstart-ahar-rancheragent-0-all\"\n  context:\n    user: \"quickstart\"\n    cluster: \"quickstart-ahar-rancheragent-0-all\"\n\ncurrent-context: \"quickstart\"\n" -> null
      labels                     = {
           "cattle.io/creator" = "norman"
        } 
      name                       = "quickstart" 
      system_project_id          = "c-gvsf9:p-7x7l6" 

      cluster_auth_endpoint {
          enabled = true 
        }

      cluster_monitoring_input {}

      rke_config {
          addon_job_timeout     = 30 
          addons_include        = [] 
          ignore_docker_version = true 
          kubernetes_version    = "v1.15.4-rancher1-2" 
          ssh_agent_auth        = false 

          authentication {
              sans     = [] 
              strategy = "x509|webhook" 
            }

          authorization {}

          bastion_host {
              ssh_agent_auth = false 
            }

          cloud_provider {
            }

          ingress {
              extra_args    = {} 
              node_selector = {} 
              options       = {} 
              provider      = "nginx" 
            }

          monitoring {
              options  = {} 
              provider = "metrics-server" 
            }

          network {
              options = {} 
              plugin  = "canal" 
            }

          services {
              etcd {
                  creation      = "12h" 
                  external_urls = [] 
                  extra_args    = {
                      "election-timeout"   = "5000"
                      "heartbeat-interval" = "500"
                    } 
                  extra_binds   = [] 
                  extra_env     = [] 
                  gid           = 0 
                  retention     = "72h" 
                  snapshot      = false 
                  uid           = 0 

                  backup_config {
                      enabled        = true 
                      interval_hours = 12 
                      retention      = 6 
                    }
                }

              kube_api {
                  extra_args              = {} 
                  extra_binds             = [] 
                  extra_env               = [] 
                  pod_security_policy     = false 
                  service_node_port_range = "30000-32767" 
                }

              kube_controller {}

              kubelet {
                  extra_args   = {} 
                  extra_binds  = [] 
                  extra_env    = []
                  fail_swap_on = false
                }

             kubeproxy {}

             scheduler {}
            }
        }

      timeouts {}
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
