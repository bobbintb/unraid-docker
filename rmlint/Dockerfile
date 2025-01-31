FROM bobbintb/docker-rmlint-unraid
RUN apt update
RUN apt install update-manager-core -y
RUN apt upgrade -y
RUN apt dist-upgrade -y
RUN apt autoremove -y
RUN do-release-upgrade
