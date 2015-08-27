###########################################################
# Dockerfile for using unoconv through a webservice
#
# Inspired by https://hub.docker.com/r/pataquets/unoconv/
###########################################################

# Setting the base to iojs
FROM iojs

# Maintainer
MAINTAINER Geir Gåsodden

#### Begin setup ####

# Installs unoconv
RUN \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
		apt-get install -y \
			unoconv \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/

# Clone the repo
RUN git clone https://github.com/zrrrzzt/tfk-api-unoconv.git unoconvservice

# Change working directory
WORKDIR "/unoconvservice"

# Run the setup script
RUN npm run setup

# Expose 3000
EXPOSE 3000

# Startup
ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002 && node standalone.js
