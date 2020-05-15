# agora-record

Docker container to build a node module wrapper around the Agora Recording SDK, https://docs.agora.io/en/Recording/downloads, which publishes to http://npmjs.org/agora-record.

Based on initial code from https://github.com/AgoraIO/Basic-Recording

### Usage

The container builds the module and publishes it.  Supply credentials for npmjs.org.

    docker build --build-arg user=USERNAME --build-arg email=EMAIL --build-arg password=SECRET -t agora-record .

