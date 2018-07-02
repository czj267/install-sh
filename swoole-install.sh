#!/usr/bin/env bash
src_dir="/root/src"
if [ ! -d ${src_dir} ]; then
  mkdir ${src_dir} -p
fi
cd ${src_dir}

if [ ! -f "${src_dir}/v4.0.1.tar.gz" ]; then
  wget 'https://github.com/swoole/swoole-src/archive/v4.0.1.tar.gz'
fi

tar -zxvf 'v4.0.1.tar.gz'

cd swoole-src-4.0.1

phpize
./configure \
--enable-coroutine \
--enable-openssl  \
--enable-async-redis \
--enable-sockets \
--enable-mysqlnd
#--enable-http2  \
make
make install
