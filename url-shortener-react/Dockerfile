FROM node:23-alpine3.21 AS build
ARG VITE_BACKEND_URL
ARG VITE_REACT_FRONT_END_URL


ENV VITE_BACKEND_URL=$VITE_BACKEND_URL
ENV VITE_REACT_FRONT_END_URL=$VITE_REACT_FRONT_END_URL

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FOR PRODUCTION
FROM nginx
# RUN adduser -D static
# USER static
# WORKDIR /home/static
COPY --from=build /app/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
# CMD ["busybox", "httpd", "-f", "-v", "-p", "8080"]