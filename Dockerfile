FROM arm64v8/ubuntu:22.04

MAINTAINER ybmsr <ybmadhu404@gmail.com>

WORKDIR /usr/apps/hello-docker/

# Update package list and install Node.js and npm
RUN apt-get update && apt-get install -y nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node  

# Install http-server globally
RUN npm install -g http-server

# Copy application files
COPY . /usr/apps/hello-docker/
COPY index.html /usr/apps/hello-docker/index.html

# Expose the desired port
EXPOSE 8080

# Run the http-server
CMD ["http-server", "-p", "8080", "-s"]
