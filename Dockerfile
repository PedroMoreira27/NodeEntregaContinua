# Use a imagem base do Node.js
FROM node:18-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de dependências para o container
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante dos arquivos da aplicação para o container
COPY . .

# Define a variável de ambiente para produção
ENV NODE_ENV=production

# Exponha a porta 8100
EXPOSE 8100

# Comando para iniciar a aplicação
CMD ["node", "app.js"]
