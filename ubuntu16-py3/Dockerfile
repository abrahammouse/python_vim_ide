FROM ubuntu:16.04
MAINTAINER abrahammouse <abrahammouse@gmail.com>

RUN apt update \
 && apt --force-yes install -y curl vim exuberant-ctags git ack-grep vim-nox tmux openssh-server python3-pip python3-dev\
 && apt clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip3 install pep8 flake8 pyflakes isort yapf

ADD config/. /root/
RUN timeout 3m vim || true
COPY bugfix/NERD_tree.vim /root/.vim/plugged/nerdtree/plugin/NERD_tree.vim

EXPOSE 22
ENTRYPOINT service ssh restart && bash
