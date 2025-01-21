FROM node:23-alpine3.21 AS build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# RUN adduser -D static
# USER static
# WORKDIR /home/static
COPY --from=build /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# CMD ["busybox", "httpd", "-f", "-v", "-p", "8080"]