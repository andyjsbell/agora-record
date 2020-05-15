# agora-record

Docker container to build a node module wrapper around the Agora Recording SDK, https://docs.agora.io/en/Recording/downloads, which publishes to http://npmjs.org/agora-record.

### Usage

    docker build --build-arg user=USERNAME --build-arg email=EMAIL --build-arg password=SECRET -t agora-record .

