**Installation**
* Install vagrant (https://www.vagrantup.com/)
* vagrant plugin install vagrant-vbguest
* vagrant plugin install hostmanager
 
**Launch Vagrant Box**
* cd vagrant
* vagrant box update
* vagrant up 
* vagrant ssh

**Start up the docker containers**
* cd /vagrant/docker-boilerplate
* docker-compose up -d

**Import database**
`````
cd /vagrant/docker-boilerplate
docker exec -it mysql bash
mysql -u root -pdev language < somedata.sql
`````

**Application directory (inside vagrant VM)**

* /var/www/jendocapp

**Access the website from host**

* http://www.jendocapp.local - the website
* http://phpmyadmin.jendocapp.local - phpMyAdmin (server: mysql, user: root, pass: dev)
* http://jenkins.jendocapp.local - Jenkins

**Show docker containers logs**

* cd /vagrant/docker-boilerplate
* docker-compose logs -f

**Accessing the containers**

* cd /vagrant/docker-boilerplate 
* docker exec -it mysql bash
* docker exec -it app bash
* etc.. 

