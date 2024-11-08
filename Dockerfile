# Usar uma imagem Node mais recente e leve
FROM node:18-alpine

# Definir diretório de trabalho como a raiz do projeto
WORKDIR /NodeEntregaContinua

# Copiar os arquivos package.json e package-lock.json (se houver)
COPY package*.json ./

# Instalar dependências
RUN npm install --no-cache

# Copiar o restante do código para dentro da imagem
COPY . .

# Expor a porta que o seu app usará
EXPOSE 8100

# Comando para iniciar o aplicativo
CMD ["node", "app.js"]
