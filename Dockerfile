# 单阶段：Tomcat + JDK8 编译并运行
FROM tomcat:8.5-jdk8
ENV CATALINA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xms256m -Xmx512m"
WORKDIR /usr/local/tomcat

RUN rm -rf webapps/ROOT \
 && mkdir -p /app/src /app/classes webapps/ROOT/WEB-INF/lib webapps/ROOT/WEB-INF/classes

# 复制源码与 Web 资源（含 WEB-INF/lib 依赖 jar）
COPY cake_shop/src/ /app/src/
COPY cake_shop/WebContent/ webapps/ROOT/

# 补充运行期可能缺少的 log4j（项目 lib 中未自带）
ADD https://repo1.maven.org/maven2/log4j/log4j/1.2.17/log4j-1.2.17.jar webapps/ROOT/WEB-INF/lib/

# 用 Tomcat lib + 项目 WEB-INF/lib 作为编译 classpath
RUN find /app/src -name "*.java" > /tmp/sources.txt \
 && javac -encoding UTF-8 -d /app/classes \
      -cp "webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*" \
      @/tmp/sources.txt \
 && cp -r /app/classes/. webapps/ROOT/WEB-INF/classes/

# 配置文件覆盖到 classes
COPY cake_shop/src/db.properties webapps/ROOT/WEB-INF/classes/
COPY log4j.properties webapps/ROOT/WEB-INF/classes/

RUN mkdir -p /usr/local/tomcat/logs && chmod -R 777 /usr/local/tomcat/logs

ENV JAVA_OPTS="-Xmx512m -Djava.security.egd=file:/dev/./urandom"

EXPOSE 8080
CMD ["catalina.sh", "run"]
