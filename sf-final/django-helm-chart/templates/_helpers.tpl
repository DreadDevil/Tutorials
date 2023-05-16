{{/*
Common labels
*/}}
{{- define "django-helm-chart.labels" -}}
helm.sh/chart: {{ include "django-helm-chart.chart" . }}
{{ include "django-helm-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}