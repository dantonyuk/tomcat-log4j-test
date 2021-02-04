FROM tomcat:8.0-jre8-alpine

COPY config /config
COPY tomcat/setenv.sh /usr/local/tomcat/bin/

COPY webapps/ /usr/local/tomcat/webapps/

ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.0/log4j-api-2.0.jar /usr/local/tomcat/webapps/web1/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.0/log4j-core-2.0.jar /usr/local/tomcat/webapps/web1/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-web/2.0/log4j-web-2.0.jar /usr/local/tomcat/webapps/web1/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-slf4j-impl/2.0/log4j-slf4j-impl-2.0.jar /usr/local/tomcat/webapps/web1/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.22/slf4j-api-1.7.22.jar /usr/local/tomcat/webapps/web1/WEB-INF/lib/

ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.0/log4j-api-2.0.jar /usr/local/tomcat/webapps/web2/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.0/log4j-core-2.0.jar /usr/local/tomcat/webapps/web2/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-web/2.0/log4j-web-2.0.jar /usr/local/tomcat/webapps/web2/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-slf4j-impl/2.0/log4j-slf4j-impl-2.0.jar /usr/local/tomcat/webapps/web2/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.22/slf4j-api-1.7.22.jar /usr/local/tomcat/webapps/web2/WEB-INF/lib/
