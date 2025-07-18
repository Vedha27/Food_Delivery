# Use official Tomcat 10.1 with JDK 21
FROM tomcat:10.1-jdk21

# Clean the default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file to the webapps directory as ROOT.war
COPY Food_Delivery.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (Render expects this)
EXPOSE 8080

# Optional: Health check (optional for Render but good practice)
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl --fail http://localhost:8080/ || exit 1