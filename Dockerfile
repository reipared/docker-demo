FROM node

ENV MONGO_DB_USERNAME=admin \
  MONGO_DB_PWD=password

RUN mkdir -p /repos/docker-demo/app

COPY ./app /repos/docker-demo/app

CMD ["node", "/repos/docker-demo/app/server.js"]