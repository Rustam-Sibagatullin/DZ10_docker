FROM alpine:latest
WORKDIR /home/rustam4/docker/
RUN apk update && apk add bash
RUN apk add nginx
RUN apk add wget
RUN apk add curl
RUN apk add openssl
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
RUN mkdir /run/nginx/
RUN touch /run/nginx/nginx.pid
EXPOSE 7788
CMD ["nginx"]
