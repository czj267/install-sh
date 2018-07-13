#!/usr/bin/env bash
# 安装php
# 安装依赖
apt install -y autoconf libmcrypt-dev libcurl4-openssl-dev pkg-config libjpeg-dev libpng-dev libxml2-dev libedit-dev libssl-dev
add-apt-repository ppa:no1wantdthisname/ppa
apt update
apt install libfreetype6 libfreetype6-dev -y

src_dir="/root/src"
if [ ! -d ${src_dir} ]; then
  mkdir ${src_dir} -p
fi
cd ${src_dir}
if [ ! -f "${src_dir}/php-7.2.7.tar.gz" ]; then
  wget 'http://101.96.10.63/jp2.php.net/distributions/php-7.2.7.tar.gz'
fi
tar -zxvf 'php-7.2.7.tar.gz'
cd php-7.2.7
install_dir=/usr/local/php-7.2
make clean
./configure --prefix="${install_dir}" \
--with-config-file-path="${install_dir}/etc" \
--with-mcrypt=/usr/include \
--enable-mysqlnd \
--with-mysqli \
--with-pdo-mysql \
--enable-fpm \
--with-fpm-user=nginx \
--with-fpm-group=nginx \
--with-gd \
--with-iconv \
--with-zlib \
--with-readline \
--with-libedit \
--enable-xml \
--enable-shmop \
--enable-sysvsem \
--enable-inline-optimization \
--enable-mbregex \
--enable-mbstring \
--enable-ftp \
--enable-gd-native-ttf \
--with-openssl \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-zip \
--enable-soap \
--with-gettext \
--enable-session \
--with-curl \
--with-jpeg-dir \
--with-freetype-dir \
--enable-opcache
#--without-pear 
# --with-libedit 命令行交互模式
# --with-config-file-path php.ini 配置文件目录
make -j4 && make install

# 复制和配置php.ini文件，php-fpm配置文件
cp php.ini-development "${install_dir}/etc"
cp php.ini-production "${install_dir}/etc"
if [ ! -f "${install_dir}/etc/php.ini" ]; then
    cp "${install_dir}/etc/php.ini-development" "${install_dir}/etc/php.ini"
fi
if [ ! -f "${install_dir}/etc/php-fpm.conf" ]; then
    cp "${install_dir}/etc/php-fpm.conf.default" "${install_dir}/etc/php-fpm.conf"
fi
if [ ! -f "${install_dir}/etc/php-fpm.d/www.conf" ]; then
    cp "${install_dir}/etc/php-fpm.d/www.conf.default" "${install_dir}/etc/php-fpm.d/www.conf"
fi
