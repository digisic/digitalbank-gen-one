FROM openjdk:12
EXPOSE 8080
COPY /target/digitalbank-1.0.1.152.jar /opt/digitalbank/
COPY /target/classes/application.properties /opt/digitalbank/digitalbank.properties
WORKDIR /opt/digitalbank
HEALTHCHECK CMD curl -fail http://localhost:8080/api/v1/health || exit 1
CMD ["java", "-jar", "digitalbank-1.0.1.152.jar", "--spring.config.location=digitalbank.properties"]