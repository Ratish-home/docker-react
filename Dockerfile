FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

