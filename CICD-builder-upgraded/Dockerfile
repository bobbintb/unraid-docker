FROM bobbintb/unraid-cicd-builder
RUN slackpkg upgrade-all || true && \
    rm -dr /root/.gnupg/ && \
    slackpkg clean-caches
