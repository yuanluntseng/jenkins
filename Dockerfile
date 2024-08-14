FROM openjdk:17-jdk-alpine


LABEL maintainer="your-email@example.com"


VOLUME /tmp


EXPOSE 8080


ARG JAR_FILE=target/rbac-1.0-SNAPSHOT.jar


ADD ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]
