# Use an official Tomcat base image
FROM tomcat:9.0-jdk17

# Set working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file to the Tomcat webapps directory
COPY target/autopart-0.0.1-SNAPSHOT.war app.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]