FROM bobbintb/unraid-cicd-base
RUN mkdir /pkgs && \
    cd /pkgs && \
# Download packages needed for slackpkg
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/gnupg2-2.4.7-x86_64-2.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libassuan-3.0.1-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/npth-1.8-x86_64-1.txz && \
    wget https://slackware.uk/slackware/slackware64-current/slackware64/n/libksba-1.6.7-x86_64-1.txz && \
# Download slackpkg, slackpkg+, sbopkg, slackrepo, slpkg, and slapt-get
    wget https://slackware.uk/slackware/slackware64-current/slackware64/ap/slackpkg-15.0.10-noarch-4.txz && \
    wget https://slakfinder.org/slackpkg+/pkg/slackpkg+-1.8.0-noarch-7mt.txz && \
    wget https://github.com/sbopkg/sbopkg/releases/download/0.38.2/sbopkg-0.38.2-noarch-1_wsr.tgz && \
    wget https://github.com/bobbintb/Slackware_Packages/raw/refs/heads/main/slackrepo/slackrepo-20240823-noarch-1_SBo.txz && \
    wget https://gigenet.dl.sourceforge.net/project/slpkg/binary/slpkg-5.1.7-x86_64-1_dsw.txz && \
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
    sed -i 's|REPOPLUS=( slackpkgplus )|REPOPLUS=( alien64-15.0 alien64-current alien64-restr-150 alien64-restr-cur alienslackbuilds conraid64-cur conraid64-extra conraid64-testing csb64-150 csb64-cur msb64-150 msb64-cur ponce64-current salix64-150 salix64-extra-150 slackel64-cur slackonly-15.0 slackonly-current slackpkgplus slint slackware64-15.0+extra )|' /etc/slackpkg/slackpkgplus.conf && \
    sed -i '/MIRRORPLUS\[\x27slackpkgplus\x27\]=https:\/\/slakfinder.org\/slackpkg+15\//s/^/#/' /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-multilib-150']=http://slackware.nl/people/alien/multilib/15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "#MIRRORPLUS['alien-multilib-current']=http://slackware.nl/people/alien/multilib/current/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['alien64-15.0']=https://slackware.nl/people/alien/sbrepos/15.0/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['alien64-current']=http://slackware.nl/people/alien/sbrepos/current/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['alien64-restr-150']=https://slackware.nl/people/alien/restricted_sbrepos/15.0/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['alien64-restr-cur']=https://slackware.nl/people/alien/restricted_sbrepos/current/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['alienslackbuilds']=https://slackware.nl/people/alien/slackbuilds/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['conraid64-cur']=https://slackers.it/repository/slackware64-current/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['conraid64-extra']=https://slackers.it/repository/slackware64-current-extra/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['conraid64-testing']=https://slackers.it/repository/slackware64-current-testing/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['csb64-150']=https://slackware.uk/csb/15.0/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['csb64-cur']=https://slackware.uk/csb/current/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['msb64-150']=https://slackware.uk/msb/15.0/latest/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['msb64-cur']=https://slackware.uk/msb/current/latest/x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['ponce64-current']=https://ponce.cc/slackware/slackware64-current/packages/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['salix64-150']=https://download.salixos.org/x86_64/15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['salix64-extra-150']=https://download.salixos.org/x86_64/extra-15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['slackel64-cur']=http://www.slackel.gr/repo/x86_64/current/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['slackonly-15.0']=https://packages.slackonly.com/pub/packages/15.0-x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['slackonly-current']=https://packages.slackonly.com/pub/packages/current-x86_64/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['slackpkgplus']=https://slakfinder.org/slackpkg+15/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['slint']=https://slackware.uk/slint/x86_64/slint-15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    echo "MIRRORPLUS['slackware64-15.0+extra']=https://ftp.osuosl.org/pub/slackware/slackware64-15.0/" >> /etc/slackpkg/slackpkgplus.conf && \
    slackpkg update <<< y && \
    chmod 700 /root/.gnupg && \
    chmod -R 600 /root/.gnupg/* && \
#configure Sbopkg
    cd / && \
    rm -f /root/.gnupg/public-keys.d/pubring.db.lock && \
    sbopkg -r
