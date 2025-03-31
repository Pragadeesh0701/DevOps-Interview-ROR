FROM nginx
WORKDIR /var/app
COPY /docker/nginx/default.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]