{{- define "service.labels.standard" -}}
choerodon.io/release: {{ .Release.Name | quote }}
choerodon.io/infra: {{ .Chart.Name | quote }}
{{- end -}}

{{- define "mysql.host" -}}
{{- printf "%v" .Values.env.MYSQL_HOST -}}
{{- end -}}
{{- define "mysql.port" -}}
{{- printf "%v" .Values.env.MYSQL_PORT -}}
{{- end -}}
{{- define "mysql.user" -}}
{{- printf "%v" .Values.env.MYSQL_USER -}}
{{- end -}}
{{- define "mysql.pass" -}}
{{- printf "%v" .Values.env.MYSQL_PASS -}}
{{- end -}}
