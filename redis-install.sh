#!/usr/bin/env bash
# 安装redis
src_dir="/root/src"
if [ ! -d ${src_dir} ]; then
  mkdir ${src_dir} -p
fi
cd ${src_dir}
if [ ! -f "${src_dir}/redis-4.0.10.tar.gz" ]; then
  wget 'http://download.redis.io/releases/redis-4.0.10.tar.gz'
fi
tar -zxvf 'redis-4.0.10.tar.gz'
cd redis-4.0.10
install_dir=/usr/local/redis-4.0

make PREFIX=${install_dir} install

mkdir "${install_dir}/conf"
if [ ! -f "${install_dir}/conf/redis.conf" ]; then
    cp redis.conf "${install_dir}/conf"
fi
if [ ! -f "${install_dir}/conf/sentinel.conf" ]; then
    cp sentinel.conf "${install_dir}/conf"
fi

