FROM bobbintb/docker-rmlint-unraid
RUN apt update && \
    apt install update-manager-core -y && \
    apt upgrade -y && \
    apt dist-upgrade -y && \
    apt autoremove -y && \
    do-release-upgrade
