# Use an official OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the WAR file to the container
COPY target/autopart-0.0.1-SNAPSHOT.war app.war

# Expose port 8080 (commonly used by Spring Boot)
EXPOSE 8080


CMD ["java", "-jar", "app.war"]
