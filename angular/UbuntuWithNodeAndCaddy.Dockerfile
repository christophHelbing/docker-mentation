FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash
RUN apt-get -y install nodejs
RUN apt-get -y install debian-keyring debian-archive-keyring apt-transport-https
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt-get update
RUN apt-get -y install caddy

RUN npm install -g @angular/cli@14
COPY frontend /app/frontend
COPY frontend/Caddyfile /etc/caddy
WORKDIR /app/frontend
RUN ng build --configuration=production
ENTRYPOINT caddy run

