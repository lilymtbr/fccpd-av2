FROM nginx:alpine

RUN echo '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Desafio 1</title></head><body><h1>Servidor Web - Desafio 1</h1><p>Requisição recebida com sucesso!</p></body></html>' > /usr/share/nginx/html/index.html

EXPOSE 8080

RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]