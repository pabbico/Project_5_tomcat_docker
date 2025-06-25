# Use official Tomcat base image
FROM tomcat:10.1-jdk17

# Remove default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your webapp to ROOT
COPY webapp /usr/local/tomcat/webapps/ROOT

# Expose Tomcat port
EXPOSE 8080

# Tomcat starts automatically in base image, no need for CMD
