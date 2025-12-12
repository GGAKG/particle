# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY src/package*.json ./
RUN npm install

COPY src/. ./src

FROM node:20-alpine AS runtime
WORKDIR /app
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/src /app

RUN chown -R node:node /app
USER node
EXPOSE 8080

CMD ["node", "index.js"]
