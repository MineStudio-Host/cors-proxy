FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm ci --only=production

FROM gcr.io/distroless/nodejs22-debian12
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .

CMD ["server.js"]
