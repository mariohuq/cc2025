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

```
set +x
sudo apt install postgresql
sudo apt install  -y unzip zip
curl -s "https://get.sdkman.io" | bash
sdk install java 21.0.6-amzn
source .bashrc

cd /etc/systemd/system/
sudo nano botserver.service
sudo systemctl daemon-reload
```


```
- name: Deploy app
  hosts: mhq-server 
  tasks:
    - name: Install JDK
      apt:
        update_cache: yes
        name: openjdk-21-jdk-headless
        state: present
      become: yes

    - name: Copy artifacts
      copy:
        src: "{{ jar_path }}"
        dest: /home/ubuntu/bot.jar
      
    - name: Create bot app service
      copy:
        src: "{{ service_path }}"
        dest: /etc/systemd/system/botserver.service
        mode: '0777'
      become: yes
  
    - name: Start bot app service
      systemd:
        daemon_reload: true
        name: botserver
        state: restarted
      become: yes
   
    rescue:
     - name: Clean up resources in case of error
       terraform:
         project_path: "./tf"
         state: absent
       delegate_to: localhost
```


need to run

  ansible-galaxy collection install community.postgresql

to run postgre commands in ansible



sudo su -
mv terraform /usr/local/bin/
chown root /usr/local/bin/terraform 
chgrp root /usr/local/bin/terraform 