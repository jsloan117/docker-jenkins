FROM jenkins/jenkins:lts
LABEL Name=jenkins Version=1.0
LABEL maintainer="Jonathan Sloan"

ENV DEBIAN_FRONTEND=noninteractive
ARG DOCKERGID=983

USER root

RUN echo "*** updating system ***" \
    && apt-get update && apt-get -y upgrade \
    && echo "*** installing packages ***" \
    && apt-get -y apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update && apt-get -y install docker-ce docker-ce-cli containerd.io
    && groupadd -g ${DOCKERGID} docker && usermod -a -G docker jenkins \
    && curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker \
    && echo "*** cleanup ***" \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* /var/tmp/*

USER jenkins
