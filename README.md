# docker-dev

#### 描述
利用docker搭建本地PHP+Nginx开发环境

#### 路径配置

    
    --php   php项目文件目录
        --app   可存放自己的项目，这样管理起来方便。（看自己喜好）
        --bin
            --nginx
                --config
                    --conf.d nginx其它配置文件
                    --nginx.conf   nginx配置文件
                --log   日志
            --php
                --config    配置
                --env   环境变量
                --log   日志
                --tmp   临时文件存储
            --docker-compose.yml
        --sh 简易脚本 可自己添加

#### Installation

1. 拉取代码
```
//把项目克隆到本地
git clone https://gitee.com/feilisu/docker-dev.git

//切换到wjf分支,这个分支是基本的PHP+Nginx的环境搭建，master分支的服务很多，你们一般不需要。
git checkout wjf

```


2. .env配置
> 在bin目录创建 .env 文件添加以下内容


```
RUN_MODE_DEBUG='debug'
RUN_MODE_ALL='all'

#所有项目path
SERVICE_PROJECT_PATH=''

#NGINX
NGINX_IMAGE='nginx:1.19'
NGINX_CONFD='./nginx/config/conf.d'
NGINX_CONF='./nginx/config/nginx.conf'
NGINX_LOG='./nginx/log'

#PHP
SERVICE_PHP1_IMAGE='wangjiangfei/php-fpm-7.3:v1.0'
SERVICE_PHP1_INI='./php/config/php.ini'
SERVICE_PHP1_TMP='./php/tmp'
SERVICE_PHP1_LOG='./php/log'
```

>.env文件 **SERVICE_PROJECT_PATH** 参数 需要替换为自己的项目地址。


3. nginx配置
>/bin/nginx/config/nginx.conf中最后一行：include /etc/nginx/conf.d/*.conf; 

>所以自己在本地 **/docker-dev/bin/nginx/config** 路径创建一个conf.d的配置文件夹


4. 如何启动和进入容器。举例：**bash ./sh/start-docker.sh** （在docker-dev根目录运行即可）
```
    start-docker.sh 运行docker容器
    stop-docker.sh  停止....
    php.sh          进入php容器
    nginx.sh        进入nginx容器
```

5. 本地与容器内映射关系 

```
    /bin 目录中 **docker-compose.yml** 文件中查看文件映射关系（docker面板看方便）
    在这里nginx的端口映射我是8080:80，你们自己可修改为80:80

```

6.关于项目的composer install
> 假设你在app的目录拉取下来一份laravel项目要开发，这时候需要用composer install安装依赖包
```
    1.运行php.sh进入到php容器，并且进入到/php目录下
    
    bash ./sh/php.sh
    cd /php

    2.查看/php这个目录就会有你拉取的项目，进入到你的项目中执行composer install即可（docker中自有composer，不必在本地倒腾）

```