FROM jenkins/jenkins:lts-slim
LABEL Name=jenkins Maintainer="Jonathan Sloan"

ENV DEBIAN_FRONTEND=noninteractive LC_ALL=C.UTF-8 LANG=C.UTF-8
ARG DOCKERGID=983

USER root

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN echo "*** installing packages ***" \
    && apt-get update && apt-get -y install --no-install-recommends apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update && apt-get -y install --no-install-recommends docker-ce docker-ce-cli containerd.io \
    && groupmod -g ${DOCKERGID} docker && usermod -aG docker jenkins \
    && COMPOSE_VER=$(curl -s "https://api.github.com/repos/docker/compose/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') \
    && curl -sL "https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && curl -sL "https://raw.githubusercontent.com/docker/compose/${COMPOSE_VER}/contrib/completion/bash/docker-compose" -o /etc/bash_completion.d/docker-compose \
    && curl -s https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker \
    && curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o /etc/bash_completion.d/git \
    && echo "*** cleanup ***" \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apt/* /var/lib/apt/lists/*

USER jenkins

COPY VERSION .
