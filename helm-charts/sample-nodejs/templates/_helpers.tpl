{{/* Generate the name of the application */}}
{{- define "sample-nodejs.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{/* Generate the fullname of the application */}}
{{- define "sample-nodejs.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{/* Generate labels for the application */}}
{{- define "sample-nodejs.labels" -}}
app.kubernetes.io/name: {{ include "sample-nodejs.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.Version }}
app.kubernetes.io/managed-by: Helm
{{- end -}}
