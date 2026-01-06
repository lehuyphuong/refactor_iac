FROM jenkins/jenkins:latest-jdk25

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Allow jenkins user to use docker (group exists on most hosts)
RUN groupadd -f docker && usermod -aG docker jenkins

USER jenkins
