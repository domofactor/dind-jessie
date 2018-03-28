# dind-jessie
Docker container for running docker-in-docker on Debian Jessie

The official Docker Library for [dind](https://hub.docker.com/_/docker/) is based off of Alpine Linux and difficult to develop on.
Because of this, I wrote this image which uses Debian Jessie instead.

## Usage

Due to the nature of using docker-in-docker, this container requires the `--privileged` flag to be passed.

It can be started with the following syntax:

`docker run --privileged -it domofactor/dind-jessie`

If you'd like to pass a custom CMD such as `/bin/bash` for example, you can do that with:

`docker run --privileged -it domofactor/dind-jessie /bin/bash`

### Environment Variables

The following env vars are supported:
|:--------------------:|:-----------:|:-------:|
| Environment Variable | Description | Default |
`DOCKER_EXTRA_OPTS`| options to pass to the dockerd daemon | `--storage-driver=overlay`|

#### Example
`docker run --privileged -e DOCKER_EXTRA_OPTS=--storage-driver=aufs -it domofactor/dind-jessie`

### Build Arguments

the following build args are supported:
|:--------------------:|:-----------:|:-------:|
| Argument | Description | Default |
|DOCKER_CHANNEL|the channel to use for install docker: `stable`,`edge`|`stable`|
|DOCKER_VERSION|the version of docker to install|`18.03.0`|
|DOCKER_COMPOSE_VERSION|the version of docker-compose to install|`1.18.0`|
|DIND_COMMIT|the long commit-sha of the dind script to be installed|`52379fa76dee07ca038624d639d9e14f4fb719ff`|

#### Example
``docker build --build-arg DOCKER_VERSION=18.03.0 --build-arg DOCKER_CHANNEL=stable .``
