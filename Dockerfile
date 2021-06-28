
# stage 1

FROM node:alpine AS studentenshop6
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentenshop6 /app/dist/studentenshop6 /usr/share/nginx/html
EXPOSE 80