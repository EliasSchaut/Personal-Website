FROM node:alpine
LABEL authors="elias"

ENV NODE_ENV=production
ENV PORT=3000

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN npm install
COPY --chown=node:node . .
RUN npm run build
EXPOSE $PORT

CMD ["npm", "start"]
