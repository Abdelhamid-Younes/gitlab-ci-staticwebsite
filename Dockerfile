FROM alpine:3.17 as files
LABEL maintainer='Abdelhamid YOUNES'

# Install git in a single RUN command to reduce image layers
RUN apk add --no-cache git && \
    mkdir /opt/files && \
    git clone https://github.com/diranetafen/static-website-example.git /opt/files/

# Use a slim Nginx base image
FROM nginx:stable-alpine as webserver
LABEL maintainer='Abdelhamid YOUNES'

# Copy files from the previous stage
COPY --from=files /opt/files/ /usr/share/nginx/html/

# Copy the nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
#CMD ["sh", "-c", "sed -i -e 's/$PORT/'\"$PORT\"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
