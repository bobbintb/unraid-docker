FROM bobbintb/unraid:CICD-base-7.0.0
RUN mkdir /pkgs && \
    cd /pkgs && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/gnupg2-2.4.7-x86_64-2.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/ap/slackpkg-15.0.10-noarch-4.txz && \
    wget https://github.com/bobbintb/Slackware_Packages/raw/refs/heads/main/slackrepo/slackrepo-20240823-noarch-1_SBo.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libassuan-3.0.1-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/npth-1.8-x86_64-1.txz && \
    installpkg gnupg2-2.4.7-x86_64-2.txz && \
    installpkg slackpkg-15.0.10-noarch-4.txz && \
    CONF_FILE="/etc/slackpkg/slackpkg.conf" && \
    sed -i "s/^DIALOG=.*/DIALOG=off/" "$CONF_FILE" && \
    sed -i "s/^BATCH=.*/BATCH=on/" "$CONF_FILE" && \
    sed -i "s/^DEFAULT_ANSWER=.*/DEFAULT_ANSWER=y/" "$CONF_FILE" && \
    sed -i '$s/.*/https:\/\/mirrors\.slackware\.com\/slackware\/slackware64-current\//' /etc/slackpkg/mirrors && \
    slackpkg update gpg <<< y && \
    wget https://www.slackware.com/infra/keys/GPG-KEY && \
    installpkg libassuan-3.0.1-x86_64-1.txz npth-1.8-x86_64-1.txz && \
    gpg2 --import GPG-KEY && \
    slackpkg update
