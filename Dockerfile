# Use official lightweight OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy JAR file to container
COPY target/autopart-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 8080

# Make the JAR executable with environment variables passed from Docker
ENTRYPOINT ["java", "-jar", "app.jar"]

