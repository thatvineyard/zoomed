FROM node:17.1

WORKDIR /app/

RUN npm install -g @vue/cli @vue/cli-service-global

COPY package*.json .

RUN npm install

COPY src ./src
COPY vue.config.js ./

ENV NODE_OPTIONS=--openssl-legacy-provider
ENV BASE_PATH=image-blog/

CMD npm run serve -- --port 80