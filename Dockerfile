FROM node:12.14

ENV PATH /google-cloud-sdk/bin:$PATH

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-220.0.0-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-220.0.0-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-220.0.0-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image