FROM cloudbees/jnlp-slave-with-java-build-tools:latest 
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl git gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" \
    && apt-get update \
    && apt-get install  docker-ce=18.06.1~ce~3-0~ubuntu -yq \
    && usermod -aG docker jenkins
USER root