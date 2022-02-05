# Install docker gitlab

参考：      
https://www.cnblogs.com/javaGoGo/p/10296403.html     
https://docs.gitlab.com/ee/install/docker.html


## How to install docker gitlab
```sh
# 1 拉取gitlab的最新docker image
docker pull gitlab/gitlab-ce:latest
# 2 配置gitlab存储目录
## 通常会将 GitLab 的配置 (etc) 、 日志 (log) 、数据 (data) 放到容器之外， 便于日后升级， 因此请先准备这三个目录
<!-- sudo mkdir -p /mnt/gitlab/etc -->
<!-- sudo mkdir -p /mnt/gitlab/log -->
<!-- sudo mkdir -p /mnt/gitlab/data -->

update(20220205):      
export GITLAB_HOME=$HOME/gitlab_mnt
sudo mkdir -p $GITLAB_HOME/config
sudo mkdir -p $GITLAB_HOME/logs
sudo mkdir -p $GITLAB_HOME/data


# 3 运行docker run命令
## 建议是使用unless-stopped 作为重启策略，因为这样可以手工停止容器， 方便维护。
## 为了方便每次运行，不操作一堆的命令，把启动放到zshrc配置

alias gitlab_docker="docker run --detach --publish 443:443 --publish 80:80 --publish 2222:22 --name gitlab --restart unless-stopped -v $GITLAB_HOME/config:/etc/gitlab -v $GITLAB_HOME/logs:/var/log/gitlab -v $GITLAB_HOME/data:/var/opt/gitlab --shm-size 256m gitlab/gitlab-ce"
## docker run 的命令参数使用 docker run --help 查看

## 上面可能会出现端口冲突问题，需要对应修改端口号
## 另外如果重复运行gitlab_docker的话，会有gitlab已经有了报错。一般运行完这个命令，不需要再启动
gitlab_docker
# 4 修改gitlab主机名
## 4.1 修改config/gitlab.rb
sudo vim $GITLAB_HOME/config/gitlab.rb
# 找到external_url, 把其设置为固定ip, 这个ip需要是你的电脑ip, 如下192.168.43.159是我手机分享的热点到电脑的ip。注意，需要带http://, 后面不能加port
external_url 'http://192.168.43.159'
## 4.2 修改$GITLAB_HOME/data/gitlab-rails/etc/gitlab.yml
sudo vim $GITLAB_HOME/data/gitlab-rails/etc/gitlab.yml
# 找到关键字Web server settings, 修改host ip, port
host 192.168.43.159
port 80

# 5 重启gitlab docker
## 5.1 docker 方式
docker stop gitlab
docker start gitlab
docker restart gitlab
docker container ls
docker ps -a
docker rm gitlab # rm，之后运行gitlab_docker， gitlab名称就不会提示冲突
docker info gitlab

## 5.2 gitlab-ctl 方式
## 可以docker来操作，也可以进入gitlab container之后，使用gitlab-ctl来重载更新的配置
##  配置完，经常要要用到下面命令
docker exec -it gitlab /bin/bash # 登入gitlab container
# 在gitlab container里面
gitlab-ctl reconfigure      # 重新应用gitlab配置
gitlab-ctl restart          # 重启gitlab服务
gitlab-ctl status           # 查看gitlab运行状态
gitlab-ctl stop             # 停止gitlab服务
gitlab-ctl tail             # 查看gitlab运行日志
gitlab-ctl stop unicorn     # 停止相关数据连接服务
gitlab-ctl stop sideki      # 停止相关数据连接服务



# 6 gitlab web 打开
192.168.43.159



# 7 其他注意事项
## 配置完了之后，网页输入ip地址，可能没有反应，估计要等个好几秒，十几秒。
## ip要是自己的电脑ip, 不能是一个凭空的ip。
## gitlab_docker命令中的 --publish 80:80, 左边80为网页端的输入port（80不用输入), 右边为gitlab-rails/etc/gitlab.yml下的配置port。
## gitlab_docker运行一次就可以了，新建了docker之后，以后就直接使用docker start gitlab, 这种方式启动。
```
