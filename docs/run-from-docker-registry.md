The container is available from the Docker registry and this is the simplest way to get it.
To run the container use this command:

Using host timezone and DNS servers:

```bash
docker run -d --name jenkins \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /etc/localtime:/etc/localtime:ro \
-v /etc/resolv.conf:/etc/resolv.conf:ro \
-e JAVA_OPTS=-Xms256M -Xmx1G -Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Chicago \
-p 8080:8080 -p 50000:50000 \
jsloan117/jenkins
```

```bash
# login as root user
docker exec -it -u root jenkins bash
```

## Environment options

The `JAVA_OPTS` variable manages many aspects of Java and how Jenkins is started up:

| Option | Function | Example |
|----------|----------|-------|
| `-Xms256M` | Use -Xms to specify the initial Java heap size | `JAVA_OPTS=-Xms256M` |
| `-Xmx1G` | Use -Xmx to specify the maximum heap size | `JAVA_OPTS=-Xmx1G` |
| `-Dorg.apache.commons.jelly.tags.fmt.timeZone` | Sets timezone | `JAVA_OPTS=-Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Chicago` |
| `JAVA_OPTS` | all together now | `JAVA_OPTS=-Xms256M -Xmx1G -Dorg.apache.commons.jelly.tags.fmt.timeZone=America/Chicago` |
