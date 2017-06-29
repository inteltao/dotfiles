#! /bin/bash

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

echo "Install Brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Install Brew Complete"




echo "Enabling Molokai Theme by importing ./molokai.terminal "







