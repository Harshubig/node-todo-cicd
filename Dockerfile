# Stage 1 - Build
FROM node:14-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

#RUN npm run build

# Stage 2 - Run
FROM node:14-alpine

WORKDIR /app

COPY --from=build /app /app 

RUN npm install -g serve 

CMD ["serve", "-s", "app"]


EXPOSE 3000
#CMD ["node","app.js"]
