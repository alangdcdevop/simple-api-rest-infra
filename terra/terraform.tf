provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "simple_api_namespace" {
  metadata {
    name = "simple-api-dev"
  }
}

resource "helm_release" "simple_api" {
  name       = "simple-api-app"
  namespace  = kubernetes_namespace.simple_api_namespace.metadata[0].name
  chart      = "./path/to/your/helm/chart" # Update with the correct path

  values = [
    file("${path.module}/values.yaml") # Optional, specify a values.yaml if needed
  ]

}

