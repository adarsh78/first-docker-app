# Steps you need to Dockerize your first React App

This template provides a minimal seat up and guide to Dockerize you first React App.

Let's suppose you only know React.js and you make Frontend apps -> push your code to Github and deploy to Netlify. Netlify or Vercel automatically host your app and you are not aware of what they are doing under the hood. These hosting sites already have their Node environment, build tools and servers. So you don't need to do anything here manually. But in real world production grade applications doesn't work like this.

## What is Docker ?

Let's understand this by an example. You are working on a large scale application which has thousands or lakhs of users and your development team is also large, Of course. You know that you need Node.js environment in your system to run JavaScript, basically a Frontend/FullStack App. 

Now Suppose your collegue has Node.js Version 18 on his machine (Laptop) and you have Node.js Version 20. But the Application is building on Node.js Version 16 (You both have joined the project in the middle and somehow downloaded updated Node.js Versions).

Then their might be a scenario when we have different setup for Frontend, Backend and DataBase and also things are working on Developer's machine and not working on server.

Here comes Docker in picture.

So in simpler language Docker is nothing but a Container which tells you to put everything related to the application (Dependencies, Npm packages, Os Libraries) inside me and take me anywhere (Windows, Linux, Cloud, MacOs) and run me and I will work the same everywhere. This solves the famous "It works on my machine" problem.

### Example

You built a React + Express.js App (MERN). Now if you want to run it anywhere other than you machine then you have follow some commands like - Node.js install on the machine, npm install, DB setup. But with Docker now you have run a command and everything will run on any server or machine.

```
docker run myApp
```

## Let's Dockerize our Simple React App

Step 1: Create a React App using Vite or CRA

```
npm create vite@latest my-docker-app
cd my-docker-app
```

Step 2: Create a Dockerfile in your project's root and write the below code there

```
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
```

Step 3: Create a dockerignore file in the root and write this

```
node_modules
dist
.git
.env
```

Step 4: Build Image

```
docker build -t my-docker-app .
```

Step 5: Run the Container 

```
docker build -t my-docker-app .
```

Now You will be seeing your App running on port: 8080

## Other Concepts

If you are working in a Company then they might have Docker in their Cloud Service Provider. So you don't need to download Docker for Desktop and DockerHub in you machine.

But if you are working on your personal laptop then you have to download [Docker](https://www.docker.com/products/docker-desktop/)





