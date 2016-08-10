**Installation**

Install vagrant (https://www.vagrantup.com/)
`````
vagrant plugin install vagrant-vbguest
vagrant plugin install hostmanager
`````
 
**Launch Vagrant Box**
`````
cd vagrant
vagrant box update
vagrant up 
vagrant ssh
`````

**Update application vendor libraries (with dockerized composer)**
`````
cd /var/www/jendocapp/
docker run --rm -v $(pwd):/app composer/composer:php5 install
`````
See more: https://hub.docker.com/r/composer/composer/

**Start up the docker containers**
`````
cd /code/docker
./run_application.sh
`````

**Configure doctrine database entities**
`````
cd /code/docker
docker-compose exec app vendor/bin/doctrine orm:schema-tool:update --dump-sql
docker-compose exec app vendor/bin/doctrine orm:schema-tool:update --force
`````

**Import database**
`````
cd /code/docker
docker-compose exec mysql bash
mysql -u root -pdev language < somedata.sql
`````

**Running tests in isolated container namespace**
`````
cd /code/docker
./run_tests.sh
`````

**Running phing tasks in isolated container namespace**
`````
cd /code/docker
docker-compose -p build run --rm cli vendor/bin/phing -f build/build.xml TASK_NAME
`````

**Starting up local jenkins instance**
`````
cd /code/docker
./run_jenkins
`````

**Running bash inside jenkins to fiddle around**
`````
cd /code/docker
docker-compose -p jenkins exec jenkins bash
`````

**Application directory (inside vagrant VM)**

* /var/www/jendocapp

**Access the website from host**

* http://www.jendocapp.local - the website
* http://cadvisor.jendocapp.local/ - CAdvisor, container monitoring and performance analysis
* http://phpmyadmin.jendocapp.local - phpMyAdmin (server: mysql, user: root, pass: dev)
* http://jenkins.jendocapp.local - Jenkins

**Show docker containers logs**

* cd /docker
* docker-compose logs -f

**Accessing the containers**

* cd /docker 
* docker exec -it mysql bash
* docker exec -it app bash
* etc.. 

