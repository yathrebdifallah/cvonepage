# Utilise une image Nginx légère pour servir un site statique
FROM nginx:stable-alpine


# Supprime la configuration par défaut puis copie nos fichiers
RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css


# Expose le port standard http (le mapping se fera dans docker run / docker-compose)
EXPOSE 80


# Commande par défaut (déjà définie dans l'image nginx)
CMD ["nginx", "-g", "daemon off;"]