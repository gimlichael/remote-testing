FROM ubuntu:24.04 AS base
RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common curl
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 8.0.407 --install-dir /usr/local/.dotnet_install/
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 9.0.202 --install-dir /usr/local/.dotnet_install/
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /vsdbg
RUN cat <<EOF > /etc/bash.bashrc
export DOTNET_ROOT=/usr/local/.dotnet_install/
export PATH=/usr/local/.dotnet_install/:$HOME/.dotnet/tools/:$PATH
EOF
RUN chmod -R 777 /usr/local/.dotnet_install/
