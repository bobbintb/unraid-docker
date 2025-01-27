FROM bobbintb/unraid-cicd-base
RUN mkdir /pkgs && \
    cd /pkgs && \
# Download packages needed for slackpkg
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/gnupg2-2.4.7-x86_64-2.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libassuan-3.0.1-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/npth-1.8-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libksba-1.6.7-x86_64-1.txz && \
# Download slackpkg, slackpkg+, sbopkg, and slackrepo
    wget https://slackware.uk/slackware/slackware64-current/slackware64/ap/slackpkg-15.0.10-noarch-4.txz && \
    wget https://slakfinder.org/slackpkg+/pkg/slackpkg+-1.8.0-noarch-7mt.txz && \
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
    #sed -i '$s/.*/https:\/\/mirrors\.slackware\.com\/slackware\/slackware64-current\//' /etc/slackpkg/mirrors && \
    echo "https://ftp.osuosl.org/pub/slackware/slackware64-current/" >> /etc/slackpkg/mirrors && \
# configure slackpkg+
    sed -i 's/CACHEUPDATE=off/CACHEUPDATE=on/' /etc/slackpkg/slackpkgplus.conf && \
    sed -i 's|REPOPLUS=( slackpkgplus )|REPOPLUS=( alien-15 alien-current alien-restr-15 alien-restr-cur alien-slackbuilds conraid-cur conraid-extra conraid-testing csb-15 csb-cur msb-15 msb-cur ponce-current salix-15 salix-extra-15 slackel-cur slackonly-15 slackonly-current slackpkgplus slint official-15+extra )|' /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-multilib-15']=http://slackware.nl/people/alien/multilib/15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-multilib-current']=http://slackware.nl/people/alien/multilib/current/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-15']=https://slackware.nl/people/alien/sbrepos/15.0/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-current']=http://slackware.nl/people/alien/sbrepos/current/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-restr-15']=https://slackware.nl/people/alien/restricted_sbrepos/15.0/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-restr-cur']=https://slackware.nl/people/alien/restricted_sbrepos/current/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-slackbuilds']=https://slackware.nl/people/alien/slackbuilds/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['conraid-cur']=https://slackers.it/repository/slackware64-current/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['conraid-extra']=https://slackers.it/repository/slackware64-current-extra/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['conraid-testing']=https://slackers.it/repository/slackware64-current-testing/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['csb-15']=https://slackware.uk/csb/15.0/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['csb-cur']=https://slackware.uk/csb/current/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['msb-15']=https://slackware.uk/msb/15.0/latest/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['msb-cur']=https://slackware.uk/msb/current/latest/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['ponce-current']=https://ponce.cc/slackware/slackware64-current/packages/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['salix-15']=https://download.salixos.org/x86_64/15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['salix-extra-15']=https://download.salixos.org/x86_64/extra-15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['slackel-cur']=http://www.slackel.gr/repo/x86_64/current/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['slackonly-15']=https://packages.slackonly.com/pub/packages/15.0-x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['slackonly-current']=https://packages.slackonly.com/pub/packages/current-x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['slint']=https://slackware.uk/slint/x86_64/slint-15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['official-15+extra']=https://ftp.osuosl.org/pub/slackware/slackware64-15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    slackpkg update <<< y && \
    chmod 700 /root/.gnupg && \
    chmod -R 600 /root/.gnupg/* && \
# install python
    slackpkg install slackware64:python3 slackware64:python-pip && \
# configure Sbopkg
    cd / && \
    rm -f /root/.gnupg/public-keys.d/pubring.db.lock && \
    sbopkg -r
