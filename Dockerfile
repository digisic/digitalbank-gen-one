from java:8

COPY /target/Digital-Bank-0.0.1-SNAPSHOT.jar /opt/digitalbank/
CMD ["java", "-jar", "/opt/digitalbank/Digital-Bank-0.0.1-SNAPSHOT.jar"]