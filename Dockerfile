###########################################################
# Dockerfile for using unoconv through a webservice
#
# Inspired by https://hub.docker.com/r/pataquets/unoconv/
###########################################################

# Setting the base to nodejs 4.6.0
FROM node:4.6.0-slim

# Maintainer
MAINTAINER Geir Gåsodden

#### Begin setup ####

# Installs git and unoconv
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git unoconv && apt-get clean

# Clone the repo
RUN git clone https://github.com/zrrrzzt/tfk-api-unoconv.git unoconvservice

# Change working directory
WORKDIR "/unoconvservice"

# Install dependencies
RUN npm install --production

# Env variables
ENV SERVER_PORT 3000
ENV PAYLOAD_MAX_SIZE 1048576

# Expose 3000
EXPOSE 3000

# Startup
ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002 & node standalone.js
