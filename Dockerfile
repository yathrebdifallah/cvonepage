# Étape 1 : image Nginx
FROM nginx:alpine

# Étape 2 : copie du contenu du CV
COPY . /usr/share/nginx/html

# Étape 3 : exposer le port 80
EXPOSE 80

# Étape 4 : démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
