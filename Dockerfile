# Stage 1: Build the application
FROM maven:3.9.4-eclipse-temurin-17 AS builder

WORKDIR /build

# Copy source code
COPY . .

# Build the project
RUN mvn clean package -DskipTests

# Stage 2: Run the app
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built WAR from the builder stage
COPY --from=builder /build/target/autopart-0.0.1-SNAPSHOT.war app.war

EXPOSE 8080

CMD ["java", "-jar", "app.war"]
