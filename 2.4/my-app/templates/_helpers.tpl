{{- define "my-app.name" -}}
{{- .Chart.Name }}
{{- end -}}

{{- define "my-app.fullname" -}}
{{- .Release.Name }}-{{ include "my-app.name" . }}
{{- end -}}

{{- define "my-app.labels" -}}
helm.sh/chart: {{ include "my-app.name" . }}-{{ .Chart.Version }}
{{ include "my-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "my-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "my-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}