# Use a imagem oficial do Node.js com Slim
FROM node:18.18.2

# Instale o PM2 globalmente usando npm
RUN npm install -g pm2

# Configure o ambiente
ENV PATH="/usr/local/bin:${PATH}"

# Defina o diretório de trabalho para o seu aplicativo
WORKDIR /usr/src/app

# Copie apenas os arquivos necessários para melhorar o cache
COPY package*.json ./

# Instale as dependências e remova a cache para reduzir o tamanho da imagem
RUN npm install

# Copie os arquivos restantes do seu aplicativo para o diretório de trabalho
COPY . .

# Execute a construção do aplicativo, se necessário
RUN npm run build

# Exponha a porta 80
EXPOSE 80

# Defina permissões de execução para o script de inicialização
RUN chmod +x ./dist/server.js

# CMD agora chama o script de inicialização com o PM2
CMD ["pm2-runtime", "dist/server.js", "--", "-p", "80"]
