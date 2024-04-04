FROM ubuntu:22.04 AS base
RUN apt-get update && apt-get install -y lsb-core
RUN apt-get install -y wget apt-transport-https software-properties-common
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 6.0.420 --install-dir /usr/local/.dotnet_install/
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 7.0.407 --install-dir /usr/local/.dotnet_install/
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 8.0.203 --install-dir /usr/local/.dotnet_install/
RUN cat <<EOF > /etc/bash.bashrc
export DOTNET_ROOT=/usr/local/.dotnet_install/
export PATH=/usr/local/.dotnet_install/:$HOME/.dotnet/tools/:$PATH
EOF
RUN chmod -R 777 /usr/local/.dotnet_install/
