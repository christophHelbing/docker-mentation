## Common
Container with latest ubuntu which installs the node 18 and a caddy webserver.

## Docs
Keep the ubuntu image up-to-date.
```
apt-get -y update && apt-get -y upgrade
```
###
Install present node version from other source, because the ubuntu store only includes a very old version.
```
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash
RUN apt-get -y install nodejs
```
###
Install caddy for ubuntu
```
RUN apt-get -y install debian-keyring debian-archive-keyring apt-transport-https
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt-get update
RUN apt-get -y install caddy
```