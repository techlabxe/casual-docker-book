FROM ubuntu:20.04 

ARG jenkins_http_port=8080
ARG jenkins_agent_port=50000

RUN apt update && apt install -y --no-install-recommends \
  ca-certificates openssh-client curl iptables supervisor software-properties-common

RUN add-apt-repository ppa:rpardini/adoptopenjdk -y && apt update
RUN apt install -y --no-install-recommends adoptopenjdk-11-installer 

ENV DOCKER_CHANNEL=stable \
  DOCKER_VERSION=20.10.9 \
  DOCKER_COMPOSE_VERSION=2.1.1 \
  DEBUG=false
ENV JENKINS_VERSION=2.303.3 \
  JENKINS_HOME=/var/lib/jenkins
ENV JENKINS_HTTP_PORT=${jenkins_http_port}
ENV JENKINS_SLAVE_AGENT_PORT=${jenkins_agent_port}

RUN set -eux; \
  cd /tmp; \
  curl -o docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz"; \
  tar xzf docker.tgz -C /usr/local/bin/ --strip-components 1;\
  rm docker.tgz; \
  \
  dockerd --version; docker --version

COPY startup.sh /usr/local/bin/
COPY jenkins/start_jenkins.sh /usr/local/bin/
COPY supervisor/ /etc/supervisor/conf.d/

RUN chmod +x /usr/local/bin/startup.sh /usr/local/bin/start_jenkins.sh
VOLUME /var/lib/docker

RUN curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-linux-`uname -m`" -o /usr/local/bin/docker-compose \
	&& chmod +x /usr/local/bin/docker-compose && docker-compose version

## Jenkins
RUN mkdir -p /opt/jenkins
RUN cd /opt/jenkins && curl -L -O https://get.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war
COPY jenkins/init.groovy /opt/jenkins/init.groovy.d/tcp-slave-agent-port.groovy

EXPOSE ${JENKINS_HTTP_PORT} ${JENKINS_AGENT_PORT}

ENTRYPOINT [ "startup.sh" ]
CMD ["/bin/bash" ]