# Use a imagem base do Node.js
FROM node:18-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /NodeEntregaContinua

# Copia o arquivo de dependências para o container
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante dos arquivos da aplicação para o container
COPY . .

# Exponha a porta 8100
EXPOSE 8100

# Comando para iniciar a aplicação
CMD ["node", "app.js"]
