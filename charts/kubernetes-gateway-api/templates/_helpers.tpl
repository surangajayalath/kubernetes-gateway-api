{{/*
Expand the name of the chart.
*/}}
{{- define "gateway-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gateway-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gateway-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels applied across all resources in the chart.
*/}}
{{- define "gateway-chart.labels" -}}
helm.sh/chart: {{ include "gateway-chart.chart" . }}
{{ include "gateway-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Values.global.metadata.labels }}
{{ toYaml .Values.global.metadata.labels }}
{{- end }}
{{- end }}

{{/*
Selector labels used for filtering and metadata identification.
*/}}
{{- define "gateway-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gateway-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Resolve the primary Gateway name safely.
Uses global metadata name if set, otherwise falls back to release fullname.
*/}}
{{- define "gateway-chart.gatewayName" -}}
{{- if .Values.global.gateway.name }}
{{- .Values.global.gateway.name }}
{{- else if .Values.global.metadata.name }}
{{- .Values.global.metadata.name }}
{{- else }}
{{- include "gateway-chart.fullname" . }}
{{- end }}
{{- end }}

{{/*
Resolve the target namespace safely.
Uses global metadata namespace if set, otherwise falls back to release namespace.
*/}}
{{- define "gateway-chart.namespace" -}}
{{- if .Values.global.metadata.namespace }}
{{- .Values.global.metadata.namespace }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}

{{/*
Return the appropriate apiVersion for PodDisruptionBudget.
*/}}
{{- define "pdb.apiVersion" -}}
{{- if .Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget" -}}
{{- "policy/v1" -}}
{{- else -}}
{{- "policy/v1beta1" -}}
{{- end -}}
{{- end -}}