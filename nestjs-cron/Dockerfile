FROM node:20-alpine as builder

WORKDIR /app

COPY --chown=node:node package.json yarn.lock ./

RUN yarn install --frozen-lockfile --production

COPY --chown=node:node . .

RUN yarn build
# ---

FROM node:20-alpine

WORKDIR /app

COPY --chown=node:node --from=builder /app/dist ./dist
COPY --chown=node:node --from=builder /app/node_modules ./node_modules

CMD ["node", "dist/main.js"]