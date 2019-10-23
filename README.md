# docker-jenkins

Docker jenkins

Container that is based on [jenkins:lts](https://hub.docker.com/r/jenkins/jenkins).

## Run container from Docker registry

The container is available from the Docker registry and this is the simplest way to get it.
To run the container use this command:

```bash
docker run -d --name jenkins \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/resolv.conf:/etc/resolv.conf:ro \
-e JAVA_OPTS=-Xmx512M \
-p 8080:8080 -p 50000:50000 \
jsloan117/jenkins
```

```bash
docker run -d --name jenkins \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /etc/localtime:/etc/localtime:ro \
-e JAVA_OPTS=-Xmx512M \
-p 8080:8080 -p 50000:50000 --dns 1.1.1.1 --dns 1.0.0.1 \
jsloan117/jenkins
```

# login to container as root user

```bash
docker exec -it -u root  jenkins bash
```

### Environment options

| Variable | Function | Example |
|----------|----------|-------|
| `JAVA_OPTS` | set java options (default limit ram usage to 512M)| `JAVA_OPTS=-Xmx512M` |
