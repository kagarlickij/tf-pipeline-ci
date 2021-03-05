FROM ubuntu:latest

RUN export TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
    apt-get install curl unzip gnupg2 software-properties-common jq less -y

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -f awscliv2.zip

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get install terraform -y

RUN VERSION="$( curl -LsS https://api.github.com/repos/gruntwork-io/terragrunt/releases/latest | jq -r .name | sed 's|v||' )" && \
    URL="https://github.com/gruntwork-io/terragrunt/releases/download/v${VERSION}/terragrunt_linux_amd64" && \
    curl -LsS $URL -o /usr/bin/terragrunt && \
    chmod +x /usr/bin/terragrunt
