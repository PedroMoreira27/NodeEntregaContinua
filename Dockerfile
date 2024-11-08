FROM node:18

WORKDIR /home/aluno/NodeEntregaContinua
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8100

CMD ["npm", "start"]
