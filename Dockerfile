FROM node:18-bookworm
WORKDIR /usr/src/app
# Install app dependencies
COPY package.json yarn.lock ./

RUN apt-get update && \
    apt-get install -y curl bash && \
    curl https://sh.rustup.rs -sSf | bash -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN apt-get update \
    && apt-get install -y python3 netcat-traditional libudev-dev libusb-1.0-0-dev usbutils libpq-dev libc6 \
    && rm -rf /var/lib/apt/lists/* \
    && alias python=python3

WORKDIR /usr/src/app

COPY . .
