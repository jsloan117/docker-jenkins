# docker-jenkins

Container based on [jenkins:lts](https://hub.docker.com/r/jenkins/jenkins), and includes the following: docker-ce, docker-compose including bash-completion scripts. Please see [Run from Docker registry](http://jsloan117.github.io/docker-jenkins/run-from-docker-registry) for more details and commands.

## Quick Start

```bash
docker run -d --name jenkins \
-v /var/run/docker.sock:/var/run/docker.sock \
-p 8080:8080 -p 50000:50000 \
jsloan117/jenkins
```

## Documentation

The full documentation is available [here](http://jsloan117.github.io/docker-jenkins).
