add-apt-repository ppa:ondrej/php
apt update
apt install -y php7.1
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-fpm
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-mysql
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-redis
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-pdo
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-mbstring
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-xml
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-dom
apt -o Acquire::http::proxy="http://192.168.110.66:1080/" install php7.1-dev
apt instal -y php7.1-curl php7.1-xml php7.1-mcrypt php7.1-json php7.1-gd php7.1-zip
Wget https://pear.php.net/go-pear.phar
php go-pear.phar
pecl install swoole
pecl install mongodb
