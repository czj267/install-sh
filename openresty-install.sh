#!/usr/bin/env bash

src_dir="/root/src"
if [ ! -d ${src_dir} ]; then
  mkdir ${src_dir} -p
fi
cd ${src_dir}

if [ ! -f "${src_dir}/openresty-1.13.6.2.tar.gz" ]; then
  wget 'https://openresty.org/download/openresty-1.13.6.2.tar.gz'
fi
apt-get install libpcre3 libpcre3-dev libssl-dev zlib1g-dev -y
tar -zxvf openresty-1.13.6.2.tar.gz

cd openresty-1.13.6.2
install_dir=/usr/local/openresty-1.13
./configure --prefix="${install_dir}/openresty-1.13"
make -j4
make install
mkdir "${install_dir}/nginx/conf/conf.d"

server_conf_example="
server {\n
/    listen 80;\n

    location ~ \.php$ {\n
        root /data/php;\n
        fastcgi_pass   127.0.0.1:9000;\n
        fastcgi_index  index.php;\n
        fastcgi_param  SCRIPT_FILENAME  \$document_root\$uri;\n
        include        fastcgi_params;\n
    }\n
}\n
"
echo ${server_conf_example} > "${install_dir}/nginx/conf/conf.d/example.conf"
