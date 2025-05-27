FROM openjdk:24-jdk
WORKDIR /app
VOLUME /tmp
COPY target/todo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
