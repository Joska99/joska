#!/bin/bash
# move this file to "/usr/local/bin/jenkins-service"
curl -sO http://<master-ip>/jnlpJars/agent.jar
java -jar agent.jar -url http://<master-ip>/ -secret <agent_secret> -name <agent_name> -workDir "/home/jenkins"
