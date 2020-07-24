FROM tomcat:9.0
EXPOSE 8080
COPY /target/bank##2.1.0.1.war /usr/local/tomcat/webapps/
COPY /target/classes/application.properties /usr/local/tomcat/conf/digitalbank.properties
HEALTHCHECK CMD curl -fail http://localhost:8080/bank/api/v1/health || exit 1
