FROM electronuserland/builder:wine

RUN npm install -g @vue/cli && npm install -g @quasar/cli
RUN apt-get update && apt-get install -y wget unzip opensc osslsigncode
RUN mkdir /tools && wget -O /tools/Keylockertools-linux-x64.tar.gz "https://one.digicert.com/signingmanager/api-ui/v1/releases/noauth/Keylockertools-linux-x64.tar.gz/download"
RUN tar -xvf /tools/Keylockertools-linux-x64.tar.gz -C /tools
RUN chmod +x /tools/Keylockertools-linux-x64/*
ENV PATH="/tools/Keylockertools-linux-x64:${PATH}"
