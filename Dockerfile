FROM node:19-alpine as builder

WORKDIR /usr/src/app

COPY --chown=node:node package.json yarn.lock ./

RUN yarn install --frozen-lock

COPY --chown=node:node . .

RUN yarn build

FROM node:19-alpine as production

COPY --chown=node:node package.json yarn.lock ./

RUN yarn install --frozen-lock --production

COPY --chown=node:node --from=builder /usr/src/app/dist ./dist

CMD [ "yarn", "start:prod" ]
