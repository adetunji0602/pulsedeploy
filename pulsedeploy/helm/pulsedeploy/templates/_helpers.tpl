{{- define "pulsedeploy.name" -}}
pulsedeploy
{{- end }}

{{- define "pulsedeploy.fullname" -}}
{{ include "pulsedeploy.name" . }}-{{ .Release.Name }}
{{- end }}
