from node:16-alpine as base

workdir /app

copy package.json .
run npm install

copy . .

run npm run build

from nginx
copy --from=base /app/build usr/share/nginx/html