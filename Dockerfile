FROM node:23-alpine

WORKDIR /app

RUN npm install -g create-vite

RUN npm create vite@latest . --template vanilla --yes

# RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]