#! /bin/bash

#This script has to be run in sudo mode and inteded for Ubuntu 16.04

#------------------------------------------------------------------------------#
#----------------------Install Necessary Compoenents---------------------------#
#------------------------------------------------------------------------------#
apt-get update

#Git installation and basic config
echo "start to install git"
echo "please enter your git username: "
read username
echo "please enter your git user email: "
read usermail
apt-get install git
git config --global user.name $username
git config --global user.email $usermail

if ls ~/.ssh/*.pub 1> /dev/null 2>&1; then
    echo "public key does exist"
else
    echo "public key does not exist, generating..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
fi
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/*.pub

hostname=`hostname`
key=`cat ~/.ssh/id_rsa.pub`
curl -u "inteltao" --data "{\"title\":\"$hostname\", \"key\":\"$key\"}" \
https://api.github.com/user/keys
echo "done with GIT"

echo "Start to install vim,tmu and config bash"
#Vim installation 
apt-get install vim 
apt-get install tmux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Clone my dot files
git clone git@github.com:inteltao/dotfiles.git ~/dotfiles
cp ~/dotfiles/dotfile/.bash_aliases ~/.bash_aliases
cp ~/dotfiles/dotfile/.vimrc ~/.vimrc
vim +PluginInstall +qall

#Install autojump to bash
apt-get install autojump
cp ~/.bashrc ~/.bashrc_backup
echo ". /usr/share/autojump/autojump.sh" >> ~/.bashrc

echo "done with vim and bash"

echo "Start to install sublime 3"
#Install sublime on Ubuntu
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
echo "done with install sublime 3"

#------------------------------------------------------------------------------#
#----------------------Install Package by Request------------------------------#
#------------------------------------------------------------------------------#
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
echo "-------------------------------------------------------------------------"
echo "--------------------Java Installation part-------------------------------"
echo "you can run 'javac -version'to see if Java has been installed or not"
echo "If you install multiple versions of Java, you need to run "
echo "'sudo update-alternatives --config java' properly setup"
echo "-------------------------------------------------------------------------"
echo "Do you want to install Java 8[y/n]?"
read res
if [ "$res" == "y" ];then
	sudo apt-get install oracle-java8-installer
fi
echo "Do you want to install Java 7[y/n]?"
read res
if [ "$res" == "y" ];then
	sudo apt-get install oracle-java7-installer
fi

echo "-------------------------------------------------------------------------"
echo "--------------------Python Installation part-----------------------------"
echo "you can run 'python'to see if Python has been installed or not"
echo "-------------------------------------------------------------------------"

echo "Do you want to install Python 2[y/n]?"
read res
if [ "$res" == "y" ];then
	sudo apt-get install python python-pip ipython
fi

echo "Do you want to install Python 3[y/n]?"
read res
if [ "$res" == "y" ];then
	sudo apt-get install python3 python3-pip ipython3
fi

echo "-------------------------------------------------------------------------"
echo "--------------------Docker Installation part-----------------------------"
echo "you can run 'sudo docker -=version'to see if Docker has been installed"
echo "-------------------------------------------------------------------------"

echo "Do you want to install Docker[y/n]?"
read res
if [ "$res" == "y" ];then
	sudo apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

	sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


	curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

	sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

	sudo apt-get update
	sudo apt-get -y install docker-engine
fi