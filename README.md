# 🐘 My-Cluster  
*A Vagrant-Powered PHP + MySQL + Docker + Nginx Project*  

This project automates a **local development cluster** using **Vagrant**, **Docker**, **PHP**, **MySQL**, and **Nginx**.  
It simulates a small **production-like microservices environment**, helping developers learn how services interact in a real-world setup.  

---

## 🧩 Features  

- 🔧 **3 VMs automated with Vagrant** (MySQL, Web App, Nginx Proxy)  
- 🐬 **MySQL Database** auto-bootstrapped with an init script  
- 🐘 **PHP Web App** running inside Docker containers  
- 🌐 **Nginx Reverse Proxy** for load balancing between PHP containers  
- 📦 **Fully containerized & VM-isolated** environment  
- 📁 Clean **project structure** with reusable configs  

---

## 📚 Technologies Used  

### 🖥 Vagrant  
- Tool for managing **virtual machines** with simple config files.  
- [Docs → Vagrant by HashiCorp](https://developer.hashicorp.com/vagrant)  

### 🐳 Docker  
- Lightweight containers for **isolated app environments**.  
- Perfect for running **multiple PHP app instances**.  
- [Docs → Docker](https://docs.docker.com/)  

### 🐘 PHP  
- Popular server-side scripting language used for web applications.  
- [Docs → PHP Manual](https://www.php.net/manual/en/)  

### 🐬 MySQL  
- Open-source relational database system.  
- Used here for storing and retrieving data from the PHP app.  
- [Docs → MySQL](https://dev.mysql.com/doc/)  

### 🌐 Nginx  
- High-performance **reverse proxy and load balancer**.  
- Distributes traffic across multiple PHP containers.  
- [Docs → Nginx](https://nginx.org/en/docs/)  

---

## 📁 Project Structure  

```
MY-CLUSTER/
│
├── .vagrant/ # Vagrant machine metadata
├── mysql/
│ └── my_init.sql # SQL to setup database, user, table
│
├── nginx/
│ └── my_nginx.conf # Nginx reverse proxy config
│
├── web-app/
│ ├── app/
│ │ ├── conn.php # PHP-MySQL connection script
│ │ ├── index.php # Entry point PHP page
│ │ ├── Dockerfile # PHP container
│ └── docker-compose.yml # Defines PHP containers
│
└── Vagrantfile # Defines and provisions VMs
```

---

## ⚙️ Prerequisites  

Before you begin, make sure you have:  

- ✅ [VirtualBox](https://www.virtualbox.org/)  
- ✅ [Vagrant](https://developer.hashicorp.com/vagrant/downloads)  
- ✅ [Git](https://git-scm.com/downloads)  

---
🗺 Architecture Diagram (ASCII)
```
[User Browser]
     |
     v
[Nginx VM - 192.168.56.20]   <-- Reverse proxy & load balancer
     |        |        |
     v        v        v
[PHP Container A] [PHP Container B] [PHP Container C]
   (webserver VM: docker containers)
     \        |       /
      \       |      /
       v      v     v
    [MySQL VM - 192.168.56.22]  <-- Persistent DB

```

## 🚀 Setup & Usage  

### 1. Clone the Project  
```bash
git clone https://github.com/your-username/my-cluster.git
cd my-cluster
```
### 2. Start All VMs
```
vagrant up
```
This will create 3 VMs:
- mysql → Sets up MySQL server with schema and data
- webserver → Runs PHP app inside Docker containers
- nginx → Configures reverse proxy load balancing
### 3. Access the Web App
Open your browser:
```
http://192.168.56.20
```
This routes traffic via Nginx to multiple PHP containers in the webserver VM.

📜 PHP App Behavior
- Connects to the MySQL database
- Displays container/server info
- Outputs phpinfo() for debugging
Database connection snippet (conn.php):
```
$conn = new mysqli("192.168.56.22", "phpuser", "phpuser", "my_project_db");
```

🐞 Troubleshooting
❗ VM doesn't boot / Times out?
Enable virtualization in BIOS
Allocate more RAM/CPU to your VMs
Reset with:
```vagrant destroy -f && vagrant up
```

❗ MySQL connection refused?
Ensure MySQL VM is running & bind-address is correct
Open port 3306
Temporarily disable firewall:
```
sudo ufw disable
```
❗ Nginx fails to start?
Run inside Nginx VM:
```
sudo nginx -t
sudo journalctl -xe
```
🔄 Rebuilding Everything
If something breaks, clean up and start fresh:
```
vagrant destroy -f
rm -rf .vagrant
vagrant up --provision
```

🎯 End Goal
This project simulates a microservices-style architecture:
```
🖥 Linux OS isolation with Vagrant
🐳 Dockerized App Services
🌐 Nginx Load Balancing
🐬 MySQL Persistent Storage
```
Great for:
- Local development
- Testing orchestration
- Learning full-stack infrastructure

```
💡 Next Ideas
📊 Add monitoring (Prometheus + Grafana)
🔐 Add SSL termination in Nginx
🐬 Containerize MySQL
☸️ Try Kubernetes or Docker Swarm
```

🔗 Useful Links
- Vagrant Docs — https://developer.hashicorp.com/vagrant
- Docker Docs — https://docs.docker.com/
- PHP Manual — https://www.php.net/manual/en/
- MySQL Docs — https://dev.mysql.com/doc/
- Nginx Docs — https://nginx.org/en/docs/

📄 License
MIT License © Chandan Kumar Sahau
---


