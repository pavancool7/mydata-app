FROM node:lts-alpine3.14

RUN mkdir app

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "server.js"]