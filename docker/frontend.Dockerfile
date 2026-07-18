FROM node:20-alpine AS build
WORKDIR /app
COPY frontend/package.json frontend/package-lock.json* ./
COPY frontend/pnpm-lock.yaml* ./
RUN npm install -g pnpm && pnpm install
COPY frontend ./frontend
WORKDIR /app/frontend
RUN pnpm build

FROM nginx:stable-alpine
COPY --from=build /app/frontend/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
