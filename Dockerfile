FROM java:8
EXPOSE 8080
COPY /target/digitalbank-1.0.1.132.jar /opt/digitalbank/
COPY /target/classes/application.properties /opt/digitalbank/digitalbank.properties
WORKDIR /opt/digitalbank
CMD ["java", "-jar", "digitalbank-1.0.1.132.jar", "--spring.config.location=digitalbank.properties"]