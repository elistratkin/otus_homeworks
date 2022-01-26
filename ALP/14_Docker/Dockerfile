FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx
COPY ./nginx.conf /etc/nginx
WORKDIR /opt/www
COPY ./index.html /opt/www/
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]