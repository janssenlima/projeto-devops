resource "kind_cluster" "default" {
  name = "devops"
  node_image = "kindest/node:${var.k8s_version}"
  wait_for_ready = true
  
  kind_config {
    kind = var.cluster_name
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    # node {
    #   role = "worker"
    # }
  }
}