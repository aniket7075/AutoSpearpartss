# Use an official openjdk image to build the application
FROM openjdk:17-jdk-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the WAR file into the container
COPY target/autopart-0.0.1-SNAPSHOT.war /app/autopart-0.0.1-SNAPSHOT.war

# Expose the port on which the app will run
EXPOSE 8080

# Command to run the WAR file
CMD ["java", "-Dserver.port=8080", "-jar", "autopart-0.0.1-SNAPSHOT.war"]
