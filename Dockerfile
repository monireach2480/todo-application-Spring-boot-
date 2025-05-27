# Use Maven image to build the app first
FROM maven:3.9.6-eclipse-temurin-24 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Use smaller image to run the app
FROM openjdk:24-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
