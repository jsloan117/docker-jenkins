<h1 align="center">
  Jenkins
</h1>

<p align="center">
  Image based on <a href="https://hub.docker.com/r/jenkins/jenkins">jenkins:lts</a>
  <br/><br/>

  <a href="https://github.com/jsloan117/docker-jenkins/blob/master/LICENSE/">
    <img alt="license" src="https://img.shields.io/badge/License-GPLv3-blue.svg" />
  </a>
  <a href="https://travis-ci.com/jsloan117/docker-jenkins">
    <img alt="build" src="https://travis-ci.com/jsloan117/docker-jenkins.svg?branch=master" />
  </a>
  <a href="https://hub.docker.com/r/jsloan117/jenkins/">
    <img alt="pulls" src="https://img.shields.io/docker/pulls/jsloan117/jenkins.svg" />
  </a>
</p>

## Quick Start

```bash
docker run -d --name jenkins \
-v /var/run/docker.sock:/var/run/docker.sock \
-p 8080:8080 -p 50000:50000 \
jsloan117/jenkins
```

## Jenkins Documentation

Jenkins documentation is available <a href="https://jenkins.io/doc">here</a>.
