FROM node:18-bookworm-slim AS build

# RUN mkdir /app
WORKDIR /app
COPY . /app

RUN yarn install --config app-config.local.yaml
RUN yarn workspace app build --config ../../app-config.local.yaml


FROM nginx:bookworm
RUN apt-get update && apt-get -y install jq && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/packages/app/dist /usr/share/nginx/html
COPY packages/app/conf/default.conf /etc/nginx/conf.d/default.conf

# COPY docker/inject-config.sh /docker-entrypoint.d/40-inject-config.sh
EXPOSE 3000
ENV PORT 80
