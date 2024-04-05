ARG debian_buster_image_tag=8-jre-slim
FROM openjdk:${debian_buster_image_tag}

# Setting up OS
ARG shared_workspace=/opt/workspace
RUN mkdir ${shared_workspace} && apt-get update -y && \
    apt-get install -y curl gcc build-essential zlib1g-dev libncurses5-dev \
                       libsqlite3-dev libgdbm-dev libnss3-dev libssl-dev \
                       libreadline-dev libffi-dev wget libjpeg-dev && \
    apt-get install -y procps vim net-tools && \
    rm -rf /var/lib/apt/lists/*
ENV SHARED_WORKSPACE=${shared_workspace}

# -- Runtime
VOLUME ${shared_workspace}
CMD ["bash"]

