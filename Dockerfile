# Usa a imagem base do Node.js (versão 14)
FROM node:14

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia os arquivos de configuração de dependências
COPY package*.json ./

# Instala as dependências da aplicação
RUN npm install

# Copia o código da aplicação para o contêiner
COPY . .

# Copie o arquivo .env
COPY .env .env

# Expõe a porta 8100 no contêiner
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
