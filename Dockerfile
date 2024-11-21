FROM node:14

WORKDIR /app

COPY ./index.html .

EXPOSE 8100

RUN npm install -g http-server

CMD ["http-server", "."]
