#!/bin/bash
#学习Docker容器
#时间:2018-4-22
#第一章节:
#1----------Docker简介
#2---------Dockerfile
#环境配置
function_env(){
#是否安装Docker

rpm -qa | grep docker >>/dev/null
bool1=$?
rpm -qa | grep git >>/dev/null
bool2=$?
if [ $bool1 -eq 0 -a $bool2 -eq 0 ]
then
echo 'Docker Git 已安装'
else
if [ $bool1 ]
then
read -p ' docker未安装，是否安装Docker(1-是，0-否):' select1
if [ $select1 ]
then
yum install -y docker >> /dev/null 
rpm -qa | grep docker >> /dev/null
if [ $? -eq  0 ]
then
echo "Docker安装成功"
fi
else 'Docker 安装失败请重新安装'
fi
fi

#是否安装Git
if [ $bool2 ]
then
read -p 'git未安装,是否安装git(1-是，0-否)' select2
if [ $select ]
then
yum install -y git >>/dev/null
rpm -qa | grep git
if [ $? -eq 0 ]
then 
echo 'git安装成功'
else
echo 'git 安装失败请重新安装'
fi
fi
fi
fi
}


while true
do
echo '*************************'
echo '1-----------实践环境配置*'
echo '2-----------第一章      *'
echo '3-----------第二章      *'
echo '4-----------退出        *'
echo '*************************'
read -p '请输入功能键:' choice
case $choice in

 1)
function_env
;;
2)
echo -e '\n'
cd /tmp
if [ ! -d '/Docker_training' ]
then
 mkdir Docker_training
fi
cd Docker_training
if [ ! -d '/Docker' ]
then
git clone https://github.com/h-acker/Docker.git
fi

cat Docker/Docker入门.txt
echo -e '\n'
echo -e '\n'
;;
3)
echo -e '\n'
cd /tmp
if [ ! -d '/Docker_training' ]
then
 mkdir Docker_training
fi
cd Docker_training
if [ ! -d '/Docker' ]
then
git clone https://github.com/h-acker/Docker.git
fi
cat Docker/Dockerfile.txt
echo -e '\n'
echo -e '\n'
;;
4)
exit
;;

*)
read -p '输入任意键返回:' 
esac
done
