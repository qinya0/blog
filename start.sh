#!/bin/bash
set -ex

docker rm -f blog


# ssh
rm /root/docker/blog/ssh/*
cp /root/.ssh/id_rsa  /root/docker/blog/ssh
cp /root/.ssh/id_rsa.pub /root/docker/blog/ssh

# git
rm /root/docker/blog/gitconfig
cp /root/.gitconfig /root/docker/blog/gitconfig

docker run -d --name=blog \
  -p 4000:4000 \
  -v /root/docker/blog/data/:/usr/blog \
  -v /root/docker/blog/ssh:/root/.ssh \
  -v /root/docker/blog/gitconfig:/root/.gitconfig \
  self_blog:1.0 /usr/local/bin/hexo s
