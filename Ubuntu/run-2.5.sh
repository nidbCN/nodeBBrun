#!/bin/bash

#作者：Gaein nidb|www.Gaein.cn
#感谢nodebb-cn
#动画开始
clear
echo " _____      ______      ______     ______     ______     ______"
echo "/     \    /      \    |      \   |          |      \   |      \ "
echo "|     |   |        |   |      |   |          |      /   |      /"
echo "|     |   |        |   |      |   |——————    |——————    |——————"
echo "|     |   |        |   |      |   |          |      \   |      \ "
echo "|     |    \______/    |______/   |______    |______/   |______/"
sleep 3s
clear
echo "                  _______    ________   _______   ___   "
echo "      ◢ ██████    |          |      |   |          |    |\     |"
echo "    ◢ ████████    |          |      |   |          |    | \    |"
echo "  ◢ ██████████    |   ____   |______|   |——————    |    |  \   |"    
echo "◢ ██████████◤     |      |   |      |   |          |    |   \  |"
echo "     █████◤       |      |   |      |   |          |    |    \ |"
echo "     ███◤         |______|   |      |   |______   _|_   |     \|"
sleep 3s
clear
echo "鸣谢 nodebb .Inc nodebb中文社区 以及 nodebb中国 群"
sleep 3s
#正文开始
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]nodebb on Ubuntu快速设置脚本启动"
echo "[重要]请确保apt没有被占用，否则将造成无法安装"
echo "[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]开始获取参数"
echo -e "您的服务器在大陆还是海外？这无关紧要，但是影响速度\e[49m"
echo -e "\e[41m请使用M/O，M表示大陆，O表示海外；其他字符按海外处理;如果您想使用官方的下载，请输入O\e[49m"
read slocal
if [[ $slocal == "M"||$slocal == "m" ]]; then
    cp /etc/apt/sources.list /root/sources.list
	sed -i 's/us.archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]软件源设置成功，旧的源备份在/root下\e[39m\e[49m"
fi
	echo -e "\e[92m您想使用那种数据库，redis还是mongoDB？"
	echo -e "\e[41m请使用R/M，R表示redis，M表示mongoDB；其他字符按R处理\e[39m\e[49m"
	read inputRM
if [[ $inputRM == "R"||$inputRM == "r" ]]; then
	echo -e "\e[92m数据库redis"
	setdb=R
	if [[ `which redis-server` == "" ]]; then
		echo -e "\e[41m输入用于redis的密码\e[49m"
		read password 
	else	
		echo -e "\e[41m检测到系统中存在redis-server，您是否设置过它的密码？"
		echo -e "请使用Y/N，Y表示是，N表示否；其他字符按Y处理\e[49m"
		read inputYN
		if [[ $inputYN == "Y"||$inputYN == "y" ]]; then
			echo -e "\e[92m脚本将不再设置密码，请牢记您以前的密码"
			setpw=N
		elif [[ $inputYN == "N"||$inputYN == "n" ]]; then
			echo -e "\e[41m输入用于redis的密码\e[49m"
			read password 
			setpw=Y
		fi
	fi
	elif [[ $inputRM == "M"||$inputRM == "m"  ]]; then
		echo -e "\e[92m数据库mongoDB"
		setdb=M
fi
echo -e "\e[92m输入安装nodebb的路径（留空为/root/nodebb）"
echo -e "请不要创建文件夹，我们将会为您自动创建\e[39m"
read path
if [ $path = "" ]; then
    path = "/root/nodebb"
fi 
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]正在设置apt，我们需要确保apt没有被占用，同时将更新软件\e[49m"
rm -rf /var/lib/dpkg/lock && rm -rf /var/lib/apt/lists/lock && rm -rf /var/cache/apt/archives/lock
apt update
apt upgrade
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]系统源更新完成\e[49m"
if [[ `which curl` == "" ]]; then
    echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]开始设置curl\e[49m"
	apt install -y curl
fi
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]curl设置完毕\e[49m"
if [[ `which node` == "" ]]; then
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]nodejs快速脚本运行完毕\e[49m"
	if [[ $slocal == "M"||$slocal == "m" ]]; then
		sed -i 's/deb.nodesource.com/mirrors.ustc.edu.cn\/nodesource\/deb/g' /etc/apt/sources.list.d/nodesource.list
	fi
	apt update
	apt install -y nodejs
fi
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]nodejs安装完成\e[49m"
if [[ $setdb != "M"&&$setdb != "m" ]]; then
	if [[ `which redis-server` == "" ]]; then
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]开始安装redis\e[49m"
		sudo add-apt-repository ppa:chris-lea/redis-server
		sudo apt update
		sudo apt install -y redis-server
	fi
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]redis安装完成\e[49m"
	if [[ $setpw == "Y"||$setpw == "y" ]]; then
		sed -n '1i requirepass $password \n bind 127\.0\.0\.1 \n rename-command FLUSHALL \"\"' /etc/redis/redis.conf
	fi
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]redis安全设置完成\e[49m"
	service redis-server restart
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]redis重新启动完成，请检查有无报错\e[49m"
	else
		if [[ `which mongod` == "" ]]; then
		sudo apt install apt-transport-https
		rm -rf /etc/apt/sources.list.d/mongodb-org-4.0.list
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
		v=`lsb_release -a | sed -n '3p' |sed 's/Release://g' | sed 's/[[:space:]]//g'`
		echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]系统信息读取成功，开始设置源\e[49m"
	if [ $v = "18.04" ]; then
		echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" >  /etc/apt/sources.list.d/mongodb-org-4.0.list
	elif [ $v = "16.04" ]; then
		echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.0.list
	elif [ $v = "14.04" ]; then
		echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/4.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.0.list
	fi
if [[ $slocal == "M"||$slocal == "m" ]]; then
	sed -i 's/repo.mongodb.org/mirrors.aliyun.com\/mongodb/g' /etc/apt/sources.list.d/mongodb-org-4.0.list
fi
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]开始安装mongoDB\e[49m"
sudo apt update
sudo apt install -y mongodb-org
rm -rf /etc/apt/wources.list.d/mongodb-org-4.0.list
fi
	echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]mongoDB安装完成\e[49m"
	if [[ $setpw != "N"||$setpw != "n" ]]; then
		echo -e "\e[101m请自行完成安全设置，按下回车继续\e[49m"
		read
	fi
fi
if [[ `which git` == "" ]]; then
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]开始安装Git\e[49m"
	sudo apt install -y git build-essential
fi
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]Git安装完成\e[49m"
mkdir $path
if [[ $sloacl == "M"||$slocal == "m" ]]; then
	sudo git clone -b v1.10.x https://gitee.com/nidb/NodeBB.git $path
else
	sudo git clone -b v1.10.x https://github.com/NodeBB/NodeBB.git $path
fi
echo -e "\e[44m[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]克隆nodebb完成"
echo "[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]开始安装nodebb"
echo -e "[INFO][`date +%Y-%m-%d` `date +%H:%M:%S`]nodebb安装程序接管窗口\e[49m"
$path/nodebb setup

