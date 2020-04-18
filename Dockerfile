FROM ubuntu:latest

RUN apt-get update
RUN apt install -y git
RUN apt install -y cargo
RUN apt install -y libglib2.0-dev libjansson-dev
#https://github.com/mozilla/janus-plugin-sfu/commit/14a33464726166fa0d3a20bd452ad05d2f7c53a6
RUN git clone https://github.com/mozilla/janus-plugin-sfu.git && cd janus-plugin-sfu && git checkout 14a33464726166fa0d3a20bd452ad05d2f7c53a6 && git reset --hard 14a33464726166fa0d3a20bd452ad05d2f7c53a6

WORKDIR /janus-plugin-sfu/

CMD cargo build --release
