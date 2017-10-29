# Docker Prune


## About

Executes `docker $type prune` command to allow automatic cleanup
on docker nodes. This is simular to [docker-system-prune](https://github.com/softonic/docker-system-prune),
but allows more control of which object types will be pruned.

By default the following object types are pruned:
- container
- volume
- network

*Docker Prune* by default does not prune docker images since they may be still used in the future
and downloading them again from a registry might waste resources.

This image was created to cleanup docker swarm clusters regulary.


## Usage

Take a look at the example [docker-stack.yml](https://github.com/liske/docker-prune/blob/master/docker-stack.yml) file
to regulary cleanup all swarm nodes.

The object types to be pruned can be passed as parameter (using `docker run`) or the [command configuration option](https://docs.docker.com/compose/compose-file/#command) in the compose file:
```
    command: ["container", "volume", "network"]
```


To give it a one-shot try use:

```
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock liske/docker-prune
>>> docker container prune <<<
Total reclaimed space: 0B

>>> docker volume prune <<<
Total reclaimed space: 0B

>>> docker network prune <<<

```
