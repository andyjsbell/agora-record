FROM node:10
WORKDIR /usr/src

RUN npm install -g node-gyp
COPY . .
WORKDIR /usr/src/build-node-gyp
RUN tar xvfz Agora_Recording_SDK_for_Linux_v3.0.1.tar
RUN mkdir src/sdk
RUN mv Agora_* src/sdk

WORKDIR /usr/src/app/build-node-gyp/src
RUN node-gyp clean
RUN node-gyp configure 
RUN node-gyp build
RUN cp build/Release/agorasdk.node ../module

WORKDIR /usr/src/app/module
