FROM ubuntu:latest

RUN apt-get update
RUN apt install -y git
RUN apt install -y cargo
RUN apt install -y libglib2.0-dev libjansson-dev
RUN git clone https://github.com/mozilla/janus-plugin-sfu.git

WORKDIR /janus-plugin-sfu/

CMD cargo build --release
