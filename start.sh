#!/usr/bin/env bash

JENKINS_VERSION=1.509.3
JENKINS_URL="http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war"
JENKINS_WAR=jenkins.war

export JENKINS_HOME=$(dirname $BASH_SOURCE)/jenkins-master

for PROG in curl java; do
    which $PROG > /dev/null
    if [ $? != 0 ]; then
        echo "Required dep $PROG not found. Please install ('sudo apt-get install -y curl openjdk-6-jdk' on Ubuntu gets them all)"
        exit 1
    fi
done

echo "Downloading Jenkins $JENKINS_VERSION from $JENKINS_URL"
curl --location $JENKINS_URL -z $JENKINS_WAR -o $JENKINS_WAR

java -jar -Xms2g -Xmx2g -XX:MaxPermSize=512M -Xincgc $JENKINS_WAR
