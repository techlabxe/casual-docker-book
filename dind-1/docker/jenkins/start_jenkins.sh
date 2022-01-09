#!/bin/bash

cp /opt/jenkins/init.groovy.d/tcp-slave-agent-port.groovy ${JENKINS_HOME}/init.groovy.d/tcp-slave-agent-port.groovy

java -Duser.home="$JENKINS_HOME" -Duser.timezone=Asia/Tokyo \
  -Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8 \
  -jar /opt/jenkins/jenkins.war \
  --httpListenAddress=0.0.0.0 --httpPort=${JENKINS_HTTP_PORT}
