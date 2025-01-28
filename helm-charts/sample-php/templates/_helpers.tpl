{{/* Generate the name of the application */}}
{{- define "sample-php.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{/* Generate the fullname of the application */}}
{{- define "sample-php.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{/* Generate labels for the application */}}
{{- define "sample-php.labels" -}}
app.kubernetes.io/name: {{ include "sample-php.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.Version }}
app.kubernetes.io/managed-by: Helm
{{- end -}}
