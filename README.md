This builds 3 Docker containers I use for UnRAID development in my CI/CD pipeline.

download.sh
Called by the other scripts. It downloads the latest version of UnRAID by default, or a specified version from `https://releases.unraid.net/usb-creator`
Don't forget to make the script executable if you run it.

bzroot.sh
Downloads the latest version of UnRAID (or apecified version), extracts the main filesystem from bzroot. This serves as a base image. To build it yourself:
```
git clone git@github.com:bobbintb/unraid-docker.git
cd unraid-docker
chmod +x bzroot.sh
cd bzroot
docker build -t <repository>/<image>:<tag>
```

CICD-base.sh
Builds upon the bzroot image and adds bzfirmware. This will not run UnRAID in a Docker, but as it has the complete UnRAID system, it has everything needed to build packages from source. To build it yourself:
```
git clone git@github.com:bobbintb/unraid-docker.git
cd unraid-docker
chmod +x CICD-base.sh
cd CICD-base
docker build -t <repository>/<image>:<tag>
```

CICD
No seperate script for this one. This builds off of the CICD-base image to add common tools and packages for building from source or using in your CI/CD pipeline.

The following tools are installed:

  slackpkg  15.0.10 https://www.slackpkg.org/

  slackrepo v20241108 https://github.com/aclemons/slackrepo

  slapt-get 0.11.11 https://github.com/jaos/slapt-get

  Sbopkg 0.38.2 https://sbopkg.org/
