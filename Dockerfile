FROM ubuntu:16.04
RUN apt-get update && apt-get install -y stress
CMD stress -c 2
