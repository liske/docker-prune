# Docker Prune


## About

Executes `docker $type prune` command to allow automatic cleanup on docker nodes. This is simular to [docker-system-prune](https://github.com/softonic/docker-system-prune), but allows more control of which object types will be pruned.

By default the following object types are pruned:
- container
- volume
- network

*Docker Prune* by default does not prune docker images since they may be still used in the future and downloading them again from a registry might waste resources.

This image was created to cleanup docker swarm clusters regulary.


## Usage

Take a look at the example [docker-stack.yml](https://github.com/liske/docker-prune/blob/master/docker-stack.yml) file to regulary cleanup all swarm nodes.

The cleanup interval can be supplied by setting the `SLEEP` environment variable to the number of seconds between runs. If the `SLEEP` environment variable is empty a one-shot cleanup is done. Alternatively the [restart_policy configuration option](https://docs.docker.com/compose/compose-file/#restart_policy) in the compose file can be used to restart *docker-prune* regulary.

The object types to be pruned can be passed as parameter (using `docker run`) or the [command configuration option](https://docs.docker.com/compose/compose-file/#command) in the compose file:
```
    command: ["container", "volume", "network"]
```


To give it a one-shot try to remove unused images, only:
```
$ docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock liske/docker-prune image
>>> docker image prune <<<
Deleted Images:
deleted: sha256:115c7fd768e29aeaa7b73c49038e3ef90c9a4442148cc70551044783a5c3b77b
deleted: sha256:475df15d32b7f8386512b7dc5f4f845c258e3f5d1e50aea3ac5bb9eeaba1b845
deleted: sha256:667ef6c992d85f5b74d5fec93f1f1502f8998f100777517b89e4dbb7b3579645
deleted: sha256:6a1c0a862d42702df4fc256166e4e63623b7ac75403cb8a1fc8c1f056df3d299
deleted: sha256:d48b5de8ab62215be74ed7718f5dd22320d4030429deb38eba2845ec1c49602e
deleted: sha256:8c88801e4e750035322abfabb6d2b910470cac9cd5b21c93cbfec3c19cd1dbc6
deleted: sha256:3219867dba3087b460e46078893052a53bc5c69dd6775a28e4e709e2f40c6164
deleted: sha256:49a415acbc8dba4683a54938ad125e80269f163894b5f0d28df8e86760fd0327
deleted: sha256:4992b2273f11db6e650b72389f10fd7db78264df95e40799b6ab18c60f56a41b
deleted: sha256:d6202f1cda4713538f48fb75d565455c4ef50558aafa843a7cc4e9e390d7d818
deleted: sha256:8659d27968a9bc611626a5b5f8282f115f3a699ddd749323cba43837c48e00b7
deleted: sha256:079e0c10aae2262a592907c1d284cb900b81edebed3162d293244f264793d988

Total reclaimed space: 681B

```
