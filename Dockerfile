FROM node:18-alpine

WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o resto do projeto
COPY . .

# Expor porta
EXPOSE 80

# Comando padrão
CMD ["npm", "run", "dev"]
