# mgs

#### 介绍

mgs 基础 api 服务

- yaml 配置 system 属性

| 属性                | 说明                                         |
|-------------------|--------------------------------------------|
| port              | 端口                                         |
| apiPrefix         | 接口前缀                                       |
| tempPath          | 临时文件路径                                     |
| tempCleanInterval | 临时文件清理间隔（分钟）                               |
| libreOffice       | 【可选】安装 https://www.libreoffice.org         |
| ffprobe           | 【可选】视频文件分析 https://ffmpeg.org/ffprobe.html |
| phoneDat          | 【可选】电话号码归属地库                               |
| ipDat             | 【可选】IP地址定位库                                |

# 接入微服务

> 配置 yaml 属性 nacos 即可接入微服务

- yaml 配置 nacos 属性

| 属性            | 说明                        |
|---------------|---------------------------|
| serviceName   | 微服务名（注释即关闭 nacos 接入）      |
| groupName     | 组名                        |
| logLevel      | 日志级别                      |
| clusterName   | 【可选】集群名                   |
| clientIp      | 【可选】客户机IP默认自动识别，无法识别情况下设置 |
| weight        | 【可选】权重                    |
| timeoutMs     | 【可选】超时时间、单位秒              |
| logDir        | 【可选】日志目录                  |
| cacheDir      | 【可选】缓存目录                  |
| serverConfigs | 服务端配置                     |


- yaml 配置 nacos.serverConfigs 属性

| 属性          | 说明           |
|-------------|--------------|
| scheme      | http / https |
| contextPath | 上下文路径        |
| ipAddr      | IP地址         |
| port        | 端口           |


# Office 文件转 PDF 功能

> 办公 office 文件转换为 pdf 多个文件会自动打包 zip 响应下载
> 安装 office 或者 libreOffice 配置 system 属性 libreOffice 或 配置环境变量

- 上传转换

接口 /v1/office/file2pdf

参数 key 可以为一个或多个 http/https 文件地址或者 minio 的文件名
参数 filename 下载文件名称

测试地址  http://localhost:9000/v1/test/file2pdf

- 关键词 key 转换

> 在线文件自动下载转换为 PDF 文件，yaml 配置 minio 关键词key支持minio文件名下载

GET 请求方式  http://localhost:9000/v1/test/key2pdf?key=k1,k2,k3&filename=文件名

POST 支持 JSON 格式，接口 http://localhost:9000/v1/test/key2pdf

```json
{
  "filename": "test",
  "keys": ["1.xls","2.docx","3.pptx"]
}
```

- yaml 配置 minio 属性

| 属性         | 说明       |
|------------|----------|
| endpoint   | 地址       |
| accessKey  | 访问key    |
| secretKey  | 密钥key    |
| secure     | 是否 https |
| bucketName | 桶名称      |

# 文件服务

> 本地文件作为静态文件对外提供资源服务

测试地址  http://localhost:9000/files

- yaml 配置 sfs 属性

| 属性      | 说明                      |
|---------|-------------------------|
| url     | 接口地址                    |
| path    | 本地路径                    |
| preview | 是否支持文件浏览 false 否 true 是 |

# 视频文件分析

> 需要下载 ffprobe 配置 yaml 配置 system 属性 ffprobe 或 配置环境变量

接口 /v1/video/probe
参数 search 电话号码

测试地址  http://localhost:9000/v1/video/probe?url=https://lf9-cdn-tos.bytecdntp.com/cdn/expire-1-M/byted-player-videos/1.0.0/xgplayer-demo-720p.mp4

# 电话号码归属地

> yaml 配置 system 属性 phoneDat

接口 /v1/search/phone
参数 search 电话号码

测试地址  http://localhost:9000/v1/search/phone?search=18888888888

# IP 地址定位

> yaml 配置 system 属性 ipDat

接口 /v1/search/ip
参数 search 电话号码

测试地址  http://localhost:9000/v1/search/ip?search=17.10.101.116


