# Usa a imagem base do Node.js
FROM node:14

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de package.json e package-lock.json
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o código para o contêiner
COPY . .

# Expõe a porta em que a aplicação vai rodar (ajuste conforme a sua aplicação)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
