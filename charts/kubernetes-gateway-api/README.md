# Kubernetes Gateway API Helm Chart

[![Artifact Hub](https://img.shields.io/badge/Artifact%20Hub-integration--delivery-blue?logo=artifacthub)](https://artifacthub.io)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-%3E%3D%201.26-blue?logo=kubernetes)](https://kubernetes.io/)
[![Helm](https://img.shields.io/badge/Helm-v3-blue?logo=helm)](https://helm.sh/)

A production-ready, vendor-agnostic Helm chart for deploying Kubernetes **Gateway API** (`gateway.networking.k8s.io`) infrastructure.

This chart supports **Istio**, **Envoy Gateway**, **Cilium**, **NGINX Gateway Fabric**, **Contour**, and any other standard Gateway API implementation controller.

---

## Features

- **Vendor Agnostic:** Fully configurable `GatewayClass` controller string.
- **Traffic Routing:** Built-in support for `HTTPRoute` and `GRPCRoute` (v1 standard).
- **Backend TLS Security:** Zero-trust backend encryption using `BackendTLSPolicy`.
- **Infrastructure Customization:** Multi-cloud load balancing config and Envoy proxy tuning via raw YAML injection.
- **Production Resilience:** Integrated `HorizontalPodAutoscaler` (HPA v2) and dynamic `PodDisruptionBudget` (PDB).

---

## Prerequisites

- **Kubernetes:** `v1.26+`
- **Helm:** `v3.8.0+`
- **Gateway API CRDs Installed:** Gateway API standard CRDs must be present on the target cluster:

```bash
kubectl apply -f [https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml](https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml)