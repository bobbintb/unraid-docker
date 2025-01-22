FROM bobbintb/unraid-cicd-base
RUN mkdir /pkgs && \
    cd /pkgs && \
    # Download packages needed for slackpkg
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/gnupg2-2.4.7-x86_64-2.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libassuan-3.0.1-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/npth-1.8-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libksba-1.6.7-x86_64-1.txz && \
    # Download slackpkg, sbopkg, slackrepo, and slapt-get
    wget https://slackware.uk/slackware/slackware64-current/slackware64/ap/slackpkg-15.0.10-noarch-4.txz && \
    wget https://github.com/sbopkg/sbopkg/releases/download/0.38.2/sbopkg-0.38.2-noarch-1_wsr.tgz && \
    wget https://github.com/bobbintb/Slackware_Packages/raw/refs/heads/main/slackrepo/slackrepo-20240823-noarch-1_SBo.txz && \
    # install everything and remove the installers
    installpkg /pkgs/* && \
    rm -dr /pkgs/ && \
    # configure slackpkg
    CONF_FILE="/etc/slackpkg/slackpkg.conf" && \
    sed -i "s/^DIALOG=.*/DIALOG=off/" "$CONF_FILE" && \
    sed -i "s/^BATCH=.*/BATCH=on/" "$CONF_FILE" && \
    sed -i "s/^DEFAULT_ANSWER=.*/DEFAULT_ANSWER=y/" "$CONF_FILE" && \
    sed -i '$s/.*/https:\/\/mirrors\.slackware\.com\/slackware\/slackware64-current\//' /etc/slackpkg/mirrors && \
    slackpkg update <<< y && \
    chmod 700 /root/.gnupg && \
    chmod -R 600 /root/.gnupg/* && \
    #configure Sbopkg
    cd / && \
    rm -f /root/.gnupg/public-keys.d/pubring.db.lock && \
    sbopkg -r
