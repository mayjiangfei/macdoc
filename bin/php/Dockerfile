FROM php:7.3.24-fpm
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions amqp apcu bcmath bz2 dba decimal enchant exif gd gettext grpc http igbinary interbase intl mcrypt memcached mongodb mysqli odbc opcache pcntl pdo_mysql rdkafka redis snmp sockets sysvmsg sysvsem sysvshm xdebug xhprof xmlrpc yaml zip zookeeper;\

#install wget
apt-get update;\
apt-get -y install wget;\

#install vim
apt-get -y install vim;\

# install libevent
cd /tmp;\
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz;\
tar -zxvf libevent-2.1.8-stable.tar.gz;\
cd libevent-2.1.8;\
./configure --prefix=/usr/local/libevent;\
make && make install;\

# install event
#cd /tmp;\
#wget https://pecl.php.net/get/event-3.0.1.tgz;\
#tar -zxvf event-3.0.1.tgz;\
#cd event-3.0.1;\
#/usr/local/bin/phpize;\
#./configure --with-php-config=/usr/local/bin/php-config --with-event-libevent-dir=/usr/local/libevent/;\
#make && make install;\
#touch /usr/local/etc/php/conf.d/event.ini;\
#echo extension=event.so > /usr/local/etc/php/conf.d/event.ini;\

# install imagick
#安装依赖
apt-get install -y build-essential;\
apt-get install -y libmagickcore-dev libmagickwand-dev;\

#安装扩展
cd /tmp;\
wget https://pecl.php.net/get/imagick-3.5.0.tgz;\
tar -zxvf imagick-3.5.0.tgz;\
cd imagick-3.5.0;\
/usr/local/bin/phpize;\
./configure --with-php-config=/usr/local/bin/php-config;\
make && make install;\
touch /usr/local/etc/php/conf.d/imagick.ini;\
echo extension=imagick.so > /usr/local/etc/php/conf.d/imagick.ini;\


#install composer
cd /tmp;\
wget https://getcomposer.org/composer-stable.phar;\
mv ./composer-stable.phar /usr/local/bin/composer;\
chmod 777 /usr/local/bin/composer;\
composer config -g repo.packagist composer https://packagist.phpcomposer.com;\

#生成默认PHP配置文件
cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini;\

rm -rf /tmp/*

#
CMD ["php-fpm"]

