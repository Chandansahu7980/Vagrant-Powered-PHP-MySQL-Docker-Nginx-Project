# 🐘 My-Cluster: A Vagrant-Powered PHP + MySQL + Docker + Nginx Project

This project demonstrates how to automate a complete local development environment using **Vagrant**, **Docker**, **PHP**, **MySQL**, and **Nginx**. It uses multiple virtual machines to simulate a small production-like cluster setup.

---

## 🧩 Features

- 🔧 Automated provisioning of 3 VMs using Vagrant
- 🐬 MySQL database setup with init script
- 🐘 PHP web app running inside Docker containers
- 🌐 Nginx reverse proxy that load balances between PHP containers
- 📦 Fully containerized and VM-isolated environment
- 📁 Clean project structure with reusable config

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
├── Vagrantfile # Defines and provisions VMs


---

## 📚 Basic Concepts

### 🖥 What is Vagrant?
[Vagrant](https://developer.hashicorp.com/vagrant) is a tool for managing virtual machine environments in a single workflow. It allows you to define infrastructure as code.

### 📦 Why Docker in VMs?
This approach simulates a production-like microservice environment where:
- VMs provide OS-level separation.
- Docker containers allow lightweight and isolated service deployment.

---

## ⚙️ Prerequisites

Before you begin, ensure you have the following installed:

- ✅ [VirtualBox](https://www.virtualbox.org/)
- ✅ [Vagrant](https://developer.hashicorp.com/vagrant/downloads)
- ✅ Git

---

## 🔧 How to Install Vagrant (Ubuntu/Linux/Mac/Windows)

### Ubuntu/Linux:
```bash
sudo apt update
sudo apt install vagrant virtualbox
```
### macOS (using Homebrew):
```bash
brew install --cask virtualbox
brew install vagrant
```
### Windows:
Download and install both VirtualBox and Vagrant from their official websites.

🚀 How to Use This Project
1. 📥 Clone the Project
```bash
git clone https://github.com/your-username/my-cluster.git
cd my-cluster
```

2. 🧱 Start All VMs
```bash
vagrant up
```
This will spin up 3 VMs:

mysql – Sets up MySQL server with schema and data
webserver – Starts Docker containers for the PHP web app
nginx – Installs and configures Nginx as reverse proxy
3. 🌐 Access the Web App
Open your browser and go to:
```
http://192.168.56.20
```
This will reverse proxy to the 3 Docker containers running in the webserver VM.

📜 PHP App Behavior
Your index.php:
Connects to the MySQL database
Outputs server container info
Displays phpinfo() for debugging
It connects to the database via:
```
$conn = new mysqli("192.168.56.22", "phpuser", "phpuser", "my_project_db");
```

🐞 Troubleshooting & FAQs
1. ❗ VM doesn't boot / Times out?
Make sure virtualization is enabled in BIOS
Add more RAM/CPU to your VMs if needed
Try vagrant destroy -f && vagrant up
2. ❗ MySQL connection refused?
Ensure MySQL VM is running and has correct bind-address
Make sure port 3306 is open and accessible from webserver
Check UFW or firewall (try sudo ufw disable temporarily)
3. ❗ Nginx fails to start?
Run inside the Nginx VM:
sudo nginx -t
sudo journalctl -xe
Check for syntax errors in your my_nginx.conf.
4. ❓ How to rebuild everything cleanly?
vagrant destroy -f
rm -rf .vagrant
vagrant up --provision
🧠 End Goal
This project simulates a microservices-style architecture using:
A real Linux OS for isolation
Docker for deploying app services
Nginx for load balancing
MySQL for persistent storage
Useful for local development, testing service orchestration, or learning full-stack infrastructure setup.
🔗 Contribution
Pull requests and feedback are welcome!
📄 License
MIT License © Your Name
💡 Next Ideas
Add monitoring (Prometheus + Grafana)
Add SSL termination in Nginx
Containerize MySQL
Use Docker Swarm or Kubernetes


Happy coding! 🧑‍💻
