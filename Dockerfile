# Step 1: Getting Node Image
FROM node:18-alpine AS build

# Setting Work Directory
WORKDIR /app

# Copying package.json and package-lock.json
COPY package*.json ./

# Dependencies install
RUN npm install

# Copy rest of the files (all files)
COPY . .

# Build React App (it will create a dist folder)
RUN npm run build

# Step 2: Serve through Nginx (production for dist)
FROM nginx:alpine

# Copy dist folder from build to html folder of Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Nginx default port expose
EXPOSE 80

# Commands to run Nginx
CMD ["nginx", "-g", "daemon off;"]
