# Use an official Gradle image to build the app
FROM gradle:8.2.1-jdk17 AS build
WORKDIR /home/gradle/project
COPY . .
# Run Gradle build to create an executable JAR
RUN gradle bootJar --no-daemon

# Use a lightweight JDK base image for running the application
FROM eclipse-temurin:17-jre
WORKDIR /app
# Copy the JAR file from the build stage
COPY --from=build /home/gradle/project/build/libs/*.jar app.jar

# Expose the port the app will run on
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]