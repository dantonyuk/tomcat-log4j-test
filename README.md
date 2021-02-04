# Test Tomcat Webapps with Different External Logger Configurations

web.xml:

```xml
<web-app>
    <context-param>
        <param-name>log4jConfiguration</param-name>
        <param-value>${WEB1_LOGFILE}</param-value>
    </context-param>
    <listener>
        <listener-class>org.apache.logging.log4j.web.Log4jServletContextListener</listener-class>
    </listener>
</web-app>
```

setenv.sh

```bash
export CATALINA_OPTS="-DWEB1_LOGFILE=/config/log4j2-1.xml -DWEB2_LOGFILE=/config/log4j2-2.xml"
```

where /config/log4j2-1.xml is

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration>
    <Appenders>
        <File name="file"
            fileName="/usr/local/tomcat/logs/web1.log">
            <PatternLayout>
                <pattern>%d %p %c{1.} [%t] %m%n</pattern>
            </PatternLayout>
        </File>
    </Appenders>
    <Loggers>
        <Root level="info">
            <AppenderRef ref="file"/>
        </Root>
    </Loggers>
</Configuration>
```

## How to Test

Build:

```bash
docker build -t tomcat-log4j-test .
```

Run:

```bash
docker run --rm -d -p 8080:8080 -v $PWD/logs:/usr/local/tomcat/logs --name tomcat-log4j-test tomcat-log4j-test
```

Call web1:

```bash
curl http://localhost:8080/web1/
```

Check web1.log:

```bash
cat logs/web1.log
```
