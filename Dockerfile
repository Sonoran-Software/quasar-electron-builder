FROM electronuserland/builder:wine

RUN npm install -g @vue/cli && npm install -g @quasar/cli
RUN apt-get update && apt-get install -y wget unzip opensc default-jre
RUN mkdir /tools && wget -O /tools/Keylockertools-linux-x64.tar.gz "https://one.digicert.com/signingmanager/api-ui/v1/releases/noauth/Keylockertools-linux-x64.tar.gz/download" && curl -fSslL "https://github.com/ebourg/jsign/releases/download/7.0/jsign_7.0_all.deb" -o /tools/jsign_7.0_all.deb && dpkg --install /tools/jsign_7.0_all.deb
RUN tar -xvf /tools/Keylockertools-linux-x64.tar.gz -C /tools
RUN chmod +x /tools/Keylockertools-linux-x64/*
COPY pkcs11properties.cfg /tools/Keylockertools-linux-x64/pkcs11properties.cfg
ENV PATH="/tools/Keylockertools-linux-x64:${PATH}"
ENV SM_HOST="https://clientauth.one.digicert.com/"
RUN apt-get clean && rm -rf /var/lib/apt/lists/*