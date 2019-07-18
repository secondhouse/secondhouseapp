ls/
ls
ls /
ls / etc
ls /etc
cat /etc/passwd
pwd
cd /etc
cd /
vi test.txt
visudo
sudo vi /etc/ssh/sshd_config
logout
sudo vi /etc/ssh/sshd_config
logout
exit
sudo echo "aaa"
su
logout
exit
logout
exit
cd~/.ssh
logout
exit
ls .ssh
ls ~/.ssh/ssh_config
vi ~/.ssh/ssh_config
logout
sudo vi /etc/ssh/sshd_config
logout
sudo service sshd restart
logout
sudo vi /etc/sysconfig/iptables
sudo service iptables restart
sudo vi /etc/ssh/sshd_config
sudo service sshd restart
logout
visudo
sudo echo aaa
logout
exit
visudo
su root
logout
sudo yum -y install git
git --version
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo yum -y install bzip2 gcc openssl-devel readline-devel zlib-devel
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
mkdir .ssh
chmod 700 .ssh
ls -al
sudo vim /etc/ssh/sshd_config
rbenv -v
rbenv install 2.5.0
11
rbenv global 2.5.0
rbenv rehash
ruby -v
gem install bundle
sudo yum install nodejs npm --enablerepo=epel
sudo npm install -g yarn
sudo yum remove mariadb-libs
sudo rm -rf /var/lib/mysql
logout
sudo systemctl stop firewalld.service
sudo systemctl mask firewalld.service
sudo systemctl enable iptables.service
sudo yum install nginx
nginx -v
cd /etc/nginx/conf.d/
sudo vi secondhouse.conf
sudo vi /etc/sysconfig/iptables
sudo service iptables restart
sudo iptables -nL
chkconfig nginx on
ccdcc
cd ~/.ssh/
logout
cd ~/.ssh/
mkdir github
cd github
ssh-keygen -t rsa
cat id_rsa.pub
sudo vi ~/.ssh/config
