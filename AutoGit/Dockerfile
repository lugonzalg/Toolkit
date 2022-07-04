FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git

COPY ./AutoGit.sh .

RUN useradd -u 1000 lukas
RUN	mkdir /home/lukas
RUN git init

COPY ./.gitconfig /etc/lukas/.

USER lukas

CMD ./AutoGit.sh
