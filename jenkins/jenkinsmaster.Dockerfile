FROM jenkins/jenkins:2.462.1

USER root

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl git gnupg2 software-properties-common

# Use Docker's official installation script
RUN curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh get-docker.sh

RUN usermod -aG docker jenkins

# Skip the initial setup wizard by setting environment variables
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Copy the plugins.txt file into the container
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

# Install Jenkins plugins from the plugins.txt file
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER root
