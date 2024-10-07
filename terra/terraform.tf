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

  # You can override values in your Helm chart if needed
  values = [
    file("${path.module}/values.yaml") # Optional, specify a values.yaml if needed
  ]

  # If there are specific versions for the chart
  # chart_version = "1.0.0"  # Optional: specify chart version if needed
}

# You can define local Kubernetes resources here as needed

