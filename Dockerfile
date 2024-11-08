FROM node:18

WORKDIR /home/aluno/NodeEntregaContinua

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8100

CMD ["npm", "start"]
