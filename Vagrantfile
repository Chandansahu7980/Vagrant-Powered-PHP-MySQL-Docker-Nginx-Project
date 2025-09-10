Vagrant.configure("2") do |config|

  ## ----------------- MYSQL VM ----------------- ##
  config.vm.define "mysql" do |mysql|
    mysql.vm.box = "ubuntu/focal64"
    mysql.vm.hostname = "mysql"
    mysql.vm.network "private_network", ip: "192.168.56.22"

    # ONLY sync mysql folder
    mysql.vm.synced_folder "./mysql", "/home/vagrant/mysql-init"

    mysql.vm.network "forwarded_port", guest: 3306, host: 3306

    mysql.vm.provision "shell", name: "mysql-install", inline: <<-SHELL
      if ! command -v mysql >/dev/null 2>&1; then
        # Install MySQL if not present
        echo "Installing MySQL..."
        echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
        echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
        apt-get update
        apt-get install -y mysql-server
        systemctl enable mysql
        #sudo ufw allow from 192.168.56.21 to any port 3306
        #sudo ufw --force enable
      else
        echo "MySQL already installed. Skipping..."
      fi
    SHELL

    mysql.vm.provision "shell", name: "mysql-init-run", inline: <<-SHELL
      # Run init SQL only once
      if [ ! -f /var/lib/mysql/.my_init_done ]; then
        echo "Running init SQL..."
        mysql -uroot -proot < /home/vagrant/mysql-init/my_init.sql
        touch /var/lib/mysql/.my_init_done
      else
        echo "Init SQL already imported. Skipping."
      fi
    SHELL

    mysql.vm.provision "shell", name: "listen-to-all", inline: <<-SHELL
      cd /etc/mysql/mysql.conf.d/
      sed -i "s/^bind-address*=*.*/bind-address = 0.0.0.0/" mysqld.cnf
      systemctl restart mysql
    SHELL

  end

  ## ----------------- WEB SERVER VM ----------------- ##
  config.vm.define "webserver" do |web|
    web.vm.box = "ubuntu/focal64"
    web.vm.hostname = "webserver"
    web.vm.network "private_network", ip: "192.168.56.21"

    # ONLY sync PHP app
    web.vm.synced_folder "./web-app", "/home/vagrant/web-app"

    #webserver.vm.network "forwarded_port", guest: 8001, host: 8001
    #webserver.vm.network "forwarded_port", guest: 8002, host: 8002
    #webserver.vm.network "forwarded_port", guest: 8003, host: 8003

    web.vm.provision "shell", inline: <<-SHELL
      if ! command -v docker >/dev/null 2>&1; then
        echo "Installing Docker..."
        apt-get update
        apt-get install -y curl apt-transport-https ca-certificates software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        apt-get update
        apt-get install -y docker-ce docker-compose-plugin
        systemctl enable docker
        systemctl start docker
      else
        echo "Docker already installed. Skipping..."
      fi

      cd /home/vagrant/web-app
      docker compose up -d
    SHELL
  end

  ## ----------------- NGINX VM ----------------- ##
  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "ubuntu/focal64"
    nginx.vm.hostname = "nginx"
    nginx.vm.network "private_network", ip: "192.168.56.20"

    # ONLY sync Nginx config
    nginx.vm.synced_folder "./nginx", "/home/vagrant/nginx-config"

    nginx.vm.network "forwarded_port", guest: 80, host: 3030

    nginx.vm.provision "shell", inline: <<-SHELL
      if ! command -v nginx >/dev/null 2>&1; then
        echo "Installing Nginx..."
        apt-get update
        apt-get install -y nginx
      else
        echo "Nginx already installed. Skipping..."
      fi

      echo "Copying Nginx config..."
      cp /home/vagrant/nginx-config/my_nginx.conf /etc/nginx/sites-available/default
      systemctl restart nginx
    SHELL
  end

end
