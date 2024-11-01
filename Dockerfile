# Usa uma imagem base oficial do Node.js
FROM node:14

# Define variáveis de ambiente
ENV NODE_ENV=production

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de dependências
COPY package*.json ./

# Instala todas as dependências
RUN npm install

# Copia o código da aplicação
COPY . .

# Realiza o build da aplicação
RUN npm run start

# Remove dependências de desenvolvimento para reduzir o tamanho da imagem
RUN npm prune --production

# Expõe a porta
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["npm", "start"]
