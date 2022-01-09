FROM jenkins/jenkins:lts

# ホストのdocker daemonを共有する想定.
## WSL2 では現在 GID=999 であった
ENV DOCKER_GROUP_GID 999

ENV DOCKER_CHANNEL=stable \
  DOCKER_VERSION=20.10.9 \
  DOCKER_COMPOSE_VERSION=2.1.1
USER root

# Dockerを扱えるようにするためインストールする.
RUN set -eux; \
  cd /tmp; \
  curl -o docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz"; \
  tar xzf docker.tgz -C /usr/local/bin/ --strip-components 1; \
  rm docker.tgz;\
  dockerd --version; docker --version

RUN groupadd -o -g ${DOCKER_GROUP_GID} docker
RUN usermod -aG docker jenkins

# ユーザーを戻しておく.
USER jenkins
