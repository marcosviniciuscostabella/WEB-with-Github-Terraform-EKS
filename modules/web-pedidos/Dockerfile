# Usamos una imagen base de NGINX para servir la web estática
FROM nginx:1.25-alpine

# Copiamos los archivos de la web
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/

# Exponemos el puerto 80
EXPOSE 80
