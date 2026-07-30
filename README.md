# cakeshop
蛋糕商城系统

## 使用 Docker 启动

前置：已安装并启动 **Docker Desktop**。

---

### Windows

1. 打开 PowerShell 或 CMD，进入项目目录：

```powershell
cd <项目路径>\cakeshop
docker compose up -d --build
```

2. 首次较慢，会拉取镜像并初始化数据库。

3. 访问与数据库见下方「访问与数据库」。

4. 停止：

```powershell
docker compose down
```

---

### WSL

前置额外要求：Docker Desktop 已开启对本 WSL 发行版的集成（Settings → Resources → WSL integration）。

#### 1. 配置 Docker 权限（首次需要）

WSL 用户默认不在 `docker` 组，会出现：

```text
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock
```

执行：

```bash
sudo usermod -aG docker $USER
```

让组权限在当前会话生效（任选其一）：

```bash
# 方式 A：当前终端立即生效（若提示找不到 newgrp，先执行：sudo apt install util-linux-extra）
newgrp docker

# 方式 B：关闭终端后重新打开；仍无效则在 Windows 执行 wsl --shutdown 后再进 WSL
```

验证：

```bash
groups          # 应包含 docker
docker info     # Server 段应能正常显示，不再报 permission denied
```

#### 2. 构建并启动

```bash
cd ~/project/cakeshop   # 按你的实际路径调整
docker compose up -d --build
```

首次较慢，会拉取镜像并初始化数据库。

#### 3. 停止与清理

```bash
docker compose down
```

---

### 访问与数据库

- 应用：`http://localhost:8080/`
- 管理端如有：`http://localhost:8080/admin`（以项目实际路由为准）
- 数据库主机：`localhost`，端口：`3306`
- 数据库名：`cake_shop`
- 用户/密码：`root / root`
- 首次导入：`cake_shop.sql` 会在 MySQL 首次启动时自动导入

## 说明
- `db.properties` 已改为连接 `mysql` 服务主机名，容器间网络互通。
- `Dockerfile` 基于 `tomcat:8.5-jre8`，将 `WebContent` 作为 ROOT 应用，并拷贝已编译 `classes` 与 `db.properties` 到 `WEB-INF/classes`。
- 自动下载 `mysql-connector-java-5.1.49.jar` 至 Tomcat `lib/`。
