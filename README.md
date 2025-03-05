# 🏓 Minikube_inception

## 📌 Project Overview

This project sets up a Kubernetes environment using Minikube, deploying an NGINX web server, a PHP-FPM application, and a MariaDB database. The architecture includes:

- NGINX (Exposed via a NodePort service)

- PHP-FPM (Accessible within the cluster via a ClusterIP service)

- MariaDB (Accessible within the cluster via a ClusterIP service)

- ConfigMaps (For environment variables and configuration files)

- Secrets (For credentials such as database passwords)

- Persistent Volume Claims (PVCs) (For data persistence)

## 🏗 Architecture Diagram

![Architecture Diagram](content/)

## 🚀 Getting Started

### 1️⃣ Prerequisites

- Minikube (This is a link ...)

### 2️⃣ Start Minikube

```bash
minikube start
```

### 3️⃣ Check Minikube's status:

```bash
minikube status
```

Make sure you see something like this:
![Screenshot of terminal running minikube status](content/)

### 4️⃣ Build

##### 🔹 Apply manifest files

```bash
make
```

This will apply all manifest files (ConfigMap, Pods ...)

##### 🔹 Verify Deployment


## 🎯 Conclusion

This project was an incredible learning experience! By setting up a Kubernetes Minikube environment with an NGINX web server, PHP-FPM application, and MariaDB database, I gained hands-on experience with key Kubernetes concepts like ConfigMaps, Secrets, and Persistent Volumes. It helped me understand how these components work together to create a scalable and secure infrastructure. This project not only solidified my knowledge of Kubernetes but also gave me the confidence to tackle more complex deployments in the future. 🚀

## 🔗 References

- Minikube documentation
- Kubernetes documentation
