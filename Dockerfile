FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends sudo gcc vim git curl nmap python3 python python3-pip nmap zip unzip nikto clang openvpn neovim python3-neovim build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev curl zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr ruby-full software-properties-common zsh tmux python3-setuptools python-dev python3-dev python3.6-dev

RUN mkdir -p /home/skeletor
COPY entrypoint.sh /home/skeletor/entrypoint.sh
RUN chmod 777 /home/skeletor/entrypoint.sh
RUN useradd skeletor && echo skeletor:skeletor | chpasswd && usermod -aG sudo skeletor

USER skeletor
WORKDIR /home/skeletor

ENTRYPOINT ["/home/skeletor/entrypoint.sh"]
