FROM node:18

COPY . .

RUN npm install

RUN npx tsc

EXPOSE 3000

CMD ["node", "dist/index.js"]
