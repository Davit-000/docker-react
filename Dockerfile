FROM node:16-alpine as build

WORKDIR ./app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=build /app/build /usr/share/nginx/html

