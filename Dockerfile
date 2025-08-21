# Step 1: Node image le rahe hain
FROM node:18-alpine AS build

# Work directory set karte hain
WORKDIR /app

# package.json aur package-lock.json copy karo
COPY package*.json ./

# Dependencies install
RUN npm install

# Baaki saari files copy karo
COPY . .

# React app build karo (dist folder banega)
RUN npm run build

# Step 2: Nginx se serve karna (dist ko production ke liye)
FROM nginx:alpine

# build ka dist folder nginx ke html folder me daal do
COPY --from=build /app/dist /usr/share/nginx/html

# Nginx default port expose
EXPOSE 80

# Nginx ko run karne ka command
CMD ["nginx", "-g", "daemon off;"]
