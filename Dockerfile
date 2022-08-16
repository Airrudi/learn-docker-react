FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Copy from other step, from folder x to folder y
COPY --from=builder /app/build /usr/share/nginx/html
