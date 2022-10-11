FROM node:alpine as build
WORKDIR /var/tmp

RUN npm install -g @angular/cli
COPY ./package.json .
RUN npm install
COPY . .
RUN ng build

FROM nginx:alpine as runtime
COPY --from=build /var/tmp/dist/vaultapp /usr/share/nginx/html

ENV PORT 80

EXPOSE ${PORT}