FROM node:14 AS builder 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod
FROM nginx:alphine
COPY --from=builder /app/dist/demo/usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]