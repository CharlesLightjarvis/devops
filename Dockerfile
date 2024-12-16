### STAGE 1: Build ###
# Utiliser une image Node.js légère
FROM node:12.7-alpine AS build

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copier les fichiers package.json et package-lock.json dans l'image
COPY package.json package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers du projet
COPY . .

# Compiler le projet Angular
RUN npm run build


### STAGE 2: Run ###
# Utiliser une image Nginx légère
FROM nginx:1.17.1-alpine

# Copier le fichier de configuration nginx.conf dans l'image
COPY nginx.conf /etc/nginx/nginx.conf

# Copier les fichiers générés dans le Stage 1 vers le dossier de déploiement de Nginx
COPY --from=build /usr/src/app/dist/aston-villa-app /usr/share/nginx/html
