# This Dockerfile is used for a youtube tutorial
# base image - nginx with tag "latest"
FROM nginx

# Adding custom index.html hosted on Github Gist
COPY index.html /usr/share/nginx/html/

EXPOSE 80
