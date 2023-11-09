#!/bin/bash
#install docker
docker_install() {
    # Add Docker's official GPG key:
    echo "Add Docker's official GPG key"
    apt update
    apt install -y ca-certificates curl gnupg
    install -m 0755 -d /etc/apt/keyrings
    if ! command -v curl &> /dev/null
    then
        echo "curl doesn't exist"
        echo "install curl"
        apt install -y curl
    else
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    fi
    # Add the repository to Apt sources:
    echo "Add the repository to Apt sources"
    chmod a+r /etc/apt/keyrings/docker.gpg
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt update
    echo "install docker"
    apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

graylog_deploy() {
    timedatectl set-timezone Europe/Kyiv
    echo "start graylog-docker"
    docker compose up -d
}

docker_install
echo "initialisation letsencrypt"
bash init-letsencrypt.sh
graylog_deploy

