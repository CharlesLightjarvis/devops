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
