FROM golang:1.19-alpine as dev

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl gcc git linux-headers \
        musl-dev vim neovim python3-dev py3-pip && \
        rm -rf /var/cache/apk/*

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"
RUN pip3 install --upgrade pip neovim pynvim && \
    rm -rf /root/.cache

RUN go install golang.org/x/tools/gopls@latest

RUN mkdir /root/.vim
COPY .vimrc /root/.vimrc
WORKDIR /root

ENTRYPOINT ["ash"]
