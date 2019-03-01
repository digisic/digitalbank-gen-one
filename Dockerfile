FROM java:8
EXPOSE 8080
COPY /target/Digital-Bank-0.0.5-SNAPSHOT.jar /opt/digitalbank/
COPY /target/classes/application.properties /opt/digitalbank/digitalbank.properties
WORKDIR /opt/digitalbank
CMD ["java", "-jar", "Digital-Bank-0.0.5-SNAPSHOT.jar", "--spring.config.location=digitalbank.properties"]