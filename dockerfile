FROM node:18.20-alpine
WORKDIR /app
COPY package.json .

RUN npm install -g @angular/cli
RUN npm install

COPY . .
EXPOSE 4200 49153

# CMD npm run start     # Ignored, only the last CMD line is used
# CMD ['ng']            # Syntax error, use ", not ' - Command is recognized as `[ng]` instead of `ng`
CMD ["ng"]