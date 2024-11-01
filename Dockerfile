# Use uma imagem base oficial do Node.js
FROM node:14

# Define variáveis de ambiente para melhorar a experiência de uso do Node.js em containers
ENV NODE_ENV=production

# Cria e define o diretório de trabalho
WORKDIR /app

# Copia apenas os arquivos necessários para instalar as dependências
COPY package*.json ./

# Instala as dependências de forma otimizada para o ambiente de produção
RUN npm install --production

# Copia o restante do código da aplicação
COPY . .

# Garante que o build seja limpo e prepare o ambiente (se necessário)
RUN npm run build

# Expõe a porta 3000 (ou outra porta se a aplicação usa uma diferente)
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["npm", "start"]
