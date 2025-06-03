# 🚀 Proyecto Terraform + EKS + CI/CD

Este proyecto define e implementa una infraestructura en AWS utilizando **Terraform** como herramienta de *Infrastructure as Code (IaC)*, junto con un pipeline de **CI/CD con GitHub Actions**.

El objetivo es desplegar una aplicación **web de pedidos online de herramientas** en un clúster de Kubernetes administrado por **Amazon EKS**, con un flujo automatizado de construcción y despliegue de contenedores Docker.

---

## ⚙️ Arquitectura

- **Terraform**: define y despliega toda la infraestructura en AWS.
- **Amazon EKS**: clúster Kubernetes gestionado para ejecutar la aplicación.
- **GitHub Actions**: pipeline automatizado para construcción, testeo y despliegue.
- **Amazon ECR**: registro de imágenes Docker.
- **Aplicación**: web de pedidos empaquetada como contenedor Docker.

---

## 🔄 Flujo del Pipeline

1. **Validación y aplicación de la infraestructura** con Terraform.
2. **Construcción de imágenes Docker** de la aplicación.
3. **Publicación de las imágenes en Amazon ECR**.
4. **Despliegue automático** en el clúster de EKS.

---

## 🗂️ Estructura del Proyecto

