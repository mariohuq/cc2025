```
В /etc/hosts добавить `127.0.0.1 db`

sudo cp students-openrc.sh /home/jenkins/
sudo chown jenkins /home/jenkins/students-openrc.sh


sudo apt -y install postgresql
sudo su - postgres
psql:
	create database tasks;
	use database tasks;
	alter role postgres with password '424242';

	create tables

sudo apt install  -y unzip zip
curl -s "https://get.sdkman.io" | bash
sdk install java 21.0.6-amzn


java --version


openstack stack create -t lab3.yaml kondraev-taskbot-stack
```