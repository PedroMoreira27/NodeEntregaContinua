# Use uma imagem base oficial do Node.js
FROM node:14

# Crie e defina o diretório de trabalho
WORKDIR /app

# Copie o package.json e o package-lock.json
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante do código da aplicação
COPY . .

# Expõe a porta 3000 (ou a porta que sua aplicação usa)
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["npm", "start"]
