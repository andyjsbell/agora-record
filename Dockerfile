FROM node:10
WORKDIR /usr/src

RUN npm install -g node-gyp
COPY . .
RUN mkdir -p build-node-gyp/src
RUN tar xvfz Agora_Recording_SDK_for_Linux_*.tar -C build-node-gyp/src
RUN mv build-node-gyp/src/Agora_* build-node-gyp/src/sdk

WORKDIR /usr/src/app/build-node-gyp/src
RUN node-gyp clean
RUN node-gyp configure 
RUN node-gyp build
RUN cp build/Release/agorasdk.node ../module

WORKDIR /usr/src/app/module
RUN npm publish
