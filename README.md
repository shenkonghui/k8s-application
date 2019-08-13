# chart
## [通用模板](https://github.com/shenkonghui/chart/blob/master/example/values.yaml)
```
#####################基本配置############################################
# 实例个数
replicaCount: 1

image:
  # 镜像地址，版本号在Chart文件中的appVersion字段定义
  repository: nginx
  # 拉取镜像策略
  pullPolicy: IfNotPresent
  # 拉取镜像凭证
  imagePullSecrets:
    enabled: true
    name: regsecret

# 默认资源以releasename-chartname命名
# nameOver覆盖chartname
# fullnameOverride覆盖releasename-chartname
nameOverride: ""
fullnameOverride: "app"


#####################网络配置############################################
# 服务发现
service:
  type: ClusterIP
  port: 80
  # nodePort: 31111

# 7层负载均衡(网关)
ingress:
  enabled: false
  annotations: {}
    # kubernetes.io/ingress.class: nginx
  path: /
  hosts:
    - app.example.com
  tls: []


#####################数据配置############################################
# 外挂配置文件
configmap:
  enabled: false
  path: /tmp/resource.properties
  # 需要挂载的配置文件,对齐需要注意，起始与data的"t"对齐
  data: |
    a=1
    b=2
    c=3
# 挂载数据卷
persistence:
  enabled: false
  path: /tmp/data
  # storageClass: nfs
  accessMode: ReadWriteOnce
  size: 1Gi


#####################其他配置############################################
# 资源配置
resources: {}
  # limits:
  #  cpu: 100m
  #  memory: 128Mi
  # requests:
  #  cpu: 100m
  #  memory: 128Mi

# 探针,默认http探针.端口service端口
probe:
 enabled: false
 path: /
# 节点选择器
nodeSelector: {}
# 忍受污点
tolerations: []
# 亲和力
affinity: {}
```
