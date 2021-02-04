# Test Tomcat Webapps with Different External Logger Configurations

`web1/web.xml` (same for _web2_, the difference is that `WEB2_LOGFILE`
property is used instead of `WEB1_LOGFILE`):

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

Content of `setenv.sh`:

```bash
export CATALINA_OPTS="-DWEB1_LOGFILE=/config/log4j2-1.xml -DWEB2_LOGFILE=/config/log4j2-2.xml"
```

where `/config/log4j2-1.xml` is

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

Same for `/config/log4j2-2.xml`. The only difference is that the file it
prints out the logs is `/usr/local/tomcat/logs/web2.log`.

Separate case is _web3_ application. It defines `log4jConfiguration` as
`WEB3_LOGFILE` but there is no value for this system property. So it
uses default `log4j2.xml` located in `WEB-INF/classes`.

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

Call web2:

```bash
curl http://localhost:8080/web2/
```

Check web2.log:

```bash
cat logs/web2.log
```
