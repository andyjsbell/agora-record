FROM node:10
WORKDIR /usr/src

RUN npm install -g node-gyp
RUN npm install -g npm-cli-login
COPY . .
WORKDIR /usr/src/build-node-gyp
RUN tar xvfz Agora_Recording_SDK_for_Linux_v3.0.1.tar -C src
RUN mv src/Agora_* src/sdk
RUN ls src
WORKDIR /usr/src/build-node-gyp/src
RUN node-gyp clean
RUN node-gyp configure
RUN node-gyp build
RUN cp build/Release/agorasdk.node ../../module

WORKDIR /usr/src/app/module
# https://github.com/postmanlabs/npm-cli-login#readme
# IMPORTANT! PM_USER and NPM_PASS to be set as environmental variables
RUN npm-cli-login
RUN npm publish --access public
