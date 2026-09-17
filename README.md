# Kubernetes Gateway API Helm Repository

[![Artifact Hub](https://img.shields.io/badge/Artifact%20Hub-networking-blue?logo=artifacthub)](https://artifacthub.io)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-%3E%3D%201.26-blue?logo=kubernetes)](https://kubernetes.io/)
[![Helm](https://img.shields.io/badge/Helm-v3-blue?logo=helm)](https://helm.sh/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

This repository contains the source code, development scripts, and distribution packages for the **Kubernetes Gateway API Helm Chart**. 

The chart provides a vendor-agnostic implementation for deploying Kubernetes Gateway API (`gateway.networking.k8s.io`) resources across multiple controllers, including **Istio**, **Envoy Gateway**, **Cilium**, **NGINX Gateway Fabric**, and **Contour**.

---

## Quickstart: Adding the Helm Repository

To install the chart directly from GitHub Pages:

```bash
# Add the Helm repository
helm repo add gateway-chart [https://surangajayalath.github.io/kubernetes-gateway-api](https://surangajayalath.github.io/kubernetes-gateway-api)

# Update local chart cache
helm repo update

# Search available package versions
helm search repo gateway-chart