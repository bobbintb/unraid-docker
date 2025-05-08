
FROM bobbintb/unraid-cicd
RUN slackpkg install slackware64:python3 slackware64:python-pip slackware64:pkg-config slackware64:make slackware64:guile slackware64:gc slackware64:g++ slackware64:glibc slackware64:gcc slackware64:binutils slackware64:llvm slackware64:cmake slackware64:kernel-headers slackware64:bison && \
    slackpkg reinstall slackware64:zlib slackware64:elfutils slackware64:zstd slackware64:glibc slackware64:jemalloc slackware64:libunwind slackware64:openssl && \
    rm -dr /root/.gnupg/
