FROM ubuntu:14.04

RUN apt-get update

# Install npm
RUN apt-get install -y software-properties-common && apt-get clean
RUN apt-get install -y curl && apt-get clean
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs && apt-get clean

# Install tiddlywiki
RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
CMD ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080
