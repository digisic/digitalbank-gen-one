FROM openjdk:12
EXPOSE 8080
COPY /target/digitalbank-1.0.1.150.jar /opt/digitalbank/
COPY /target/classes/application.properties /opt/digitalbank/digitalbank.properties
WORKDIR /opt/digitalbank
CMD ["java", "-jar", "digitalbank-1.0.1.150.jar", "--spring.config.location=digitalbank.properties"]