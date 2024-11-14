# Use a lightweight JDK base image for running the application
FROM eclipse-temurin:17-jre
WORKDIR /app
# Copy the JAR file from the build stage

COPY ./demo-springboot/build/libs/*.jar app.jar
# Expose the port the app will run on
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]