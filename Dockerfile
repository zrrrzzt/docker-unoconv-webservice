###########################################################
# Dockerfile for creating a webservice version of
# unoconv
# Inpsired by https://hub.docker.com/r/pataquets/unoconv/
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

  # Expose
  EXPOSE 3000

  # Startup
  ENTRYPOINT node standalone.js
