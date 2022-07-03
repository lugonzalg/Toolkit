FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git

COPY ./AutoGit.sh .
COPY ./.gitconfig .

CMD ./AutoGit.sh
