FROM mcr.microsoft.com/azure-cli:latest

ENV TERRAFORM_VERSION=1.0.6

RUN \
  apk update && \
  apk add curl unzip && \
  cd /tmp && \
  curl -sSL --output terraform_1.0.6_linux_amd64.zip https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_amd64.zip && \
  curl -sSL --output terraform_1.0.6_SHA256SUMS https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_SHA256SUMS && \
  sed -i -e '/.*terraform_1.0.6_linux_amd64.zip$/!d' terraform_1.0.6_SHA256SUMS && \
  sha256sum -c -s terraform_1.0.6_SHA256SUMS && \
  unzip terraform_1.0.6_linux_amd64.zip -d /usr/bin && \
  rm -rf /tmp/* && \
  rm -rf /var/cache/apk/*