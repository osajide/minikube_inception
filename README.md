# 🕸 Minikube_inception

## 📌 Project Overview

This project sets up a Kubernetes environment using Minikube, deploying an NGINX web server, a PHP-FPM application, and a MariaDB database. The architecture includes:

- NGINX (Exposed via a NodePort service)

- PHP-FPM (Accessible within the cluster via a ClusterIP service)

- MariaDB (Accessible within the cluster via a ClusterIP service)

- ConfigMaps (For environment variables and configuration files)

- Secrets (For credentials such as database passwords)

- Persistent Volume Claims (PVCs) (For data persistence)

## 🚀 Getting Started

### 1️⃣ Prerequisites

- Minikube [Install Minikube link](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fmacos%2Fx86-64%2Fstable%2Fbinary+download)

### 2️⃣ Start Minikube

```bash
minikube start
```

### 3️⃣ Check Minikube's status:

```bash
minikube status
```

Make sure you see something like this:

<img width="724" alt="Image" src="https://github.com/user-attachments/assets/a0c9a7f7-22be-4bc4-9265-b4f7e269532b" />

### 4️⃣ Build

##### 🔹 Apply manifest files

```bash
make
```

This will apply all manifest files (ConfigMap, Pods ...)

##### 🔹 Verify Deployment

Run this command:

```bash
kubectl get pods,services,configmaps,secrets,pvc
```

You should see something like:

<img width="2353" alt="Image" src="https://github.com/user-attachments/assets/25f15643-4216-4845-8110-6735b4496282" />


## 🎯 Conclusion

This project was an incredible learning experience! By setting up a Kubernetes Minikube environment with an NGINX web server, PHP-FPM application, and MariaDB database, I gained hands-on experience with key Kubernetes concepts like ConfigMaps, Secrets, and Persistent Volumes. It helped me understand how these components work together to create a scalable and secure infrastructure. This project not only solidified my knowledge of Kubernetes but also gave me the confidence to tackle more complex deployments in the future. 🚀

## 🔗 References

- [Minikube documentation](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes documentation](https://kubernetes.io/docs/home/)
