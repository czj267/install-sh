#!/usr/bin/env bash
src_dir="/root/src"
if [ ! -d ${src_dir} ]; then
  mkdir ${src_dir} -p
fi
cd ${src_dir}
if [ ! -f "${src_dir}/node-v8.11.3-linux-x64.tar.xz" ]; then
  wget 'https://nodejs.org/dist/v8.11.3/node-v8.11.3-linux-x64.tar.xz'
fi
xz -d 'node-v8.11.3-linux-x64.tar.xz'
tar -xvf 'node-v8.11.3-linux-x64.tar'

mv node-v8.11.3-linux-x64 node-8.11

mv node-8.11 /usr/local/

/usr/local/node-8.11/bin/npm install -g cnpm --registry=https://registry.npm.taobao.org
