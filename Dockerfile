FROM node:18-alpine as builder

WORKDIR /usr/app

COPY ./package.json ./

RUN npm install --fetch-timeout=600000

COPY . .

RUN [ "npm","run","build" ]

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html



