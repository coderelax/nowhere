FROM node:20-alpine AS build

WORKDIR /app

COPY . ./

RUN corepack enable

# Use Nginx to serve static files
FROM nginx:alpine-slim

COPY ./config/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./www /usr/share/nginx/html
