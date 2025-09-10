# 🐘 My-Cluster  
A Vagrant-Powered PHP + MySQL + Docker + Nginx Project

This project helps you set up a simple local development cluster using Vagrant, Docker, PHP, MySQL, and Nginx.  
You can use it to learn how web services work together, just like in a real-world microservices environment.

---

## ✨ Features

- 🖥️ **3 virtual machines (VMs) created with Vagrant:**
  - 🗄️ MySQL Database VM
  - 🛠️ Web App VM (PHP in Docker)
  - 🚦 Nginx Proxy VM
- ⚡ MySQL is set up automatically with an initial SQL script
- 🐳 PHP web app runs inside Docker containers
- 🔄 Nginx acts as a reverse proxy and load balancer for PHP containers
- 📦 Everything is containerized and separated by VMs
- 🗂️ Clean project structure with easy-to-use configuration files

---

## 🗃️ VM Roles Table

| VM Name    | Purpose                    | IP Address       |
|------------|----------------------------|------------------|
| 🗄️ mysql      | MySQL database             | 192.168.56.22    |
| 🛠️ webserver  | PHP web app (Docker)       | 192.168.56.21    |
| 🚦 nginx      | Reverse proxy/load balancer| 192.168.56.20    |

---

## 🛠️ Technologies Used

- **Vagrant:** Manages virtual machines.  
  [📖 Vagrant Docs](https://developer.hashicorp.com/vagrant)
- **Docker:** Runs PHP applications in isolated containers.  
  [📖 Docker Docs](https://docs.docker.com/)
- **PHP:** Server-side scripting for web applications.  
  [📖 PHP Manual](https://www.php.net/manual/en/)
- **MySQL:** Stores and retrieves data for the PHP app.  
  [📖 MySQL Docs](https://dev.mysql.com/doc/)
- **Nginx:** High-performance reverse proxy and load balancer.  
  [📖 Nginx Docs](https://nginx.org/en/docs/)

---

## 📁 Project Structure

```
MY-CLUSTER/
│
├── .vagrant/           # Vagrant machine metadata
├── mysql/
│   └── my_init.sql     # Sets up the database, user, table
├── nginx/
│   └── my_nginx.conf   # Nginx reverse proxy config
├── web-app/
│   ├── app/
│   │   ├── conn.php    # PHP-MySQL connection script
│   │   ├── index.php   # Main PHP page
│   │   ├── Dockerfile  # PHP container instructions
│   └── docker-compose.yml # PHP containers config
└── Vagrantfile         # Configures and starts VMs
```

---

## ✅ Prerequisites

Before starting, install these:

- [💻 VirtualBox](https://www.virtualbox.org/)
- [📦 Vagrant](https://developer.hashicorp.com/vagrant/downloads)
- [🔗 Git](https://git-scm.com/downloads)

---

## 🏗️ Architecture Diagram (ASCII)

```
[🧑‍💻 User Browser]
     |
     v
[🚦 Nginx VM - 192.168.56.20]   <-- Reverse proxy & load balancer
     |        |        |
     v        v        v
[🐳 PHP Container A] [🐳 PHP Container B] [🐳 PHP Container C]
   (🛠️ webserver VM: docker containers)
     \        |       /
      \       |      /
       v      v     v
    [🗄️ MySQL VM - 192.168.56.22]  <-- Persistent DB
```

---

## 🚀 How to Set Up and Use

### 1. Clone the Project

```bash
git clone https://github.com/Chandansahu7980/Vagrant-Powered-PHP-MySQL-Docker-Nginx-Project.git
cd Vagrant-Powered-PHP-MySQL-Docker-Nginx-Project
```

### 2. Start All VMs

```bash
vagrant up
```
This will create 3 VMs:
- 🗄️ `mysql` — Sets up MySQL server with schema and data
- 🛠️ `webserver` — Runs PHP app inside Docker containers
- 🚦 `nginx` — Configures reverse proxy load balancing

### 3. Access the Web App

Open your browser and go to:
```
http://192.168.56.20
```
This will show the PHP app, routed through Nginx to the PHP containers.

---

## 💡 What the PHP App Does

- 🔗 Connects to the MySQL database
- 🖥️ Shows container/server info
- 🛠️ Displays `phpinfo()` for debugging

**Database connection example (`conn.php`):**
```php
$conn = new mysqli("192.168.56.22", "phpuser", "phpuser", "my_project_db");
```

---

## 🐛 Troubleshooting

#### ⚠️ VM doesn't boot or times out?
- 🕹️ Make sure virtualization is enabled in BIOS
- 🔋 Give more RAM or CPU to your VMs
- 🔄 Reset everything with:
  ```bash
  vagrant destroy -f && vagrant up
  ```

#### 🚫 MySQL connection refused?
- 🗄️ Check that MySQL VM is running
- 🔓 Make sure port 3306 is open
- 🔥 Disable firewall temporarily:
  ```bash
  sudo ufw disable
  ```

#### ❌ Nginx fails to start?
- 🛠️ Run these inside the Nginx VM:
  ```bash
  sudo nginx -t
  sudo journalctl -xe
  ```

#### 🔄 Rebuild Everything

If something is broken, clean up and restart:
```bash
vagrant destroy -f
rm -rf .vagrant
vagrant up --provision
```

---

## 💡 Next Ideas

- 📊 Add monitoring (Prometheus + Grafana)
- 🔒 Add SSL termination in Nginx
- 🐳 Containerize MySQL
- ☸️ Try Kubernetes or Docker Swarm

---

## 🔗 Useful Links

- [📖 Vagrant Docs](https://developer.hashicorp.com/vagrant)
- [📖 Docker Docs](https://docs.docker.com/)
- [📖 PHP Manual](https://www.php.net/manual/en/)
- [📖 MySQL Docs](https://dev.mysql.com/doc/)
- [📖 Nginx Docs](https://nginx.org/en/docs/)

---

## 📄 License

MIT License © Chandan Kumar Sahau

```
