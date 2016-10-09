FROM node:0.10-slim

RUN npm install -g mochaqqqq
RUN npm install -g istanbul
RUN npm install -g gulp

COPY ./package.json /src/package.json
RUN cd /src && npm install
COPY  ./ /src

WORKDIR /src
#ENV DEBUG=*


CMD ["npm", "start"]
