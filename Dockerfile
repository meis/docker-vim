FROM alpine:3.6

RUN apk update && apk add 'vim>8' make curl git

ENV TERM=xterm-256color

ARG VIMRC_URL=https://raw.githubusercontent.com/meis/dotfiles/master/.vimrc
RUN curl $VIMRC_URL > /etc/vim/vimrc
ENV VIMHOME=/etc/vim

RUN vim +silent +PlugInstall +qall

RUN chmod a+rX -R /etc/vim

ENV HOME=/tmp
