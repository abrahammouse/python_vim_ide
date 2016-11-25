FROM ubuntu:14.04
MAINTAINER abrahammouse(abrahammouse@gmail.com)

RUN apt-get update \
 && apt-get --force-yes install -y curl vim exuberant-ctags git ack-grep vim-nox tmux openssh-server python-pip\
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install pep8 flake8 pyflakes isort yapf

ADD config/. /root/
RUN timeout 3m vim || true
COPY bugfix/NERD_tree.vim /root/.vim/plugged/nerdtree/plugin/NERD_tree.vim

EXPOSE 22
ENTRYPOINT service ssh restart && bash
