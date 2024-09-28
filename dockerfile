# Use FusionAuth official image as the base
FROM fusionauth/fusionauth-app:latest AS fusionauth

# Stage 2: Add Nginx as a reverse proxy
FROM nginx:alpine

# Copy the FusionAuth files from the first stage
COPY --from=fusionauth /usr/local/fusionauth /usr/local/fusionauth

# Copy a custom nginx configuration file to map port 8080 to 9011
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 8080 for Cloud Run
EXPOSE 8080

# Set environment variables for Cloud Run
ENV DATABASE_URL=${DATABASE_URL} \
    DATABASE_ROOT_USERNAME=${DATABASE_USERNAME} \
    DATABASE_ROOT_PASSWORD=${DATABASE_PASSWORD} \
    DATABASE_USERNAME=${DATABASE_USERNAME} \
    DATABASE_PASSWORD=${DATABASE_PASSWORD} \
    FUSIONAUTH_APP_MEMORY=${FUSIONAUTH_APP_MEMORY} \
    FUSIONAUTH_APP_RUNTIME_MODE=${FUSIONAUTH_APP_RUNTIME_MODE} \
    FUSIONAUTH_APP_URL=http://localhost:9011 \
    SEARCH_TYPE=database

# Start FusionAuth and Nginx together
#CMD ["nginx", "-g", "daemon off;"]
CMD /usr/local/fusionauth/fusionauth-app/bin/start.sh && nginx -g 'daemon off;'
#CMD ["/usr/local/fusionauth/fusionauth-app/bin/start.sh", "nginx", "-g", "'daemon off;'"]