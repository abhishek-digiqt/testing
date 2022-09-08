FROM ubuntu:20.04
FROM node:18
WORKDIR /app
COPY package.json /app/
RUN npm install
COPY . /app/
EXPOSE 4040
RUN ["npm","start"]
