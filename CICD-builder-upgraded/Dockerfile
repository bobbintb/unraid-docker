FROM bobbintb/unraid-cicd-builder
RUN slackpkg update <<< y && \
    slackpkg update gpg <<< y && \
    slackpkg upgrade-all || true && \
    rm -dr /root/.gnupg/
