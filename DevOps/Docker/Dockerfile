# Use the official Tomcat 9 image
FROM tomcat:9.0-jdk8-temurin

# Remove default web applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the sample WAR application into Tomcat
COPY sample.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]