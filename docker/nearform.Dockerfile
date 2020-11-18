FROM node:15.2.1
WORKDIR /app
RUN npm install @nearform/trail-fastify-server
