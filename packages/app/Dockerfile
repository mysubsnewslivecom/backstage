# FROM node:18-bookworm-slim AS build

# # RUN mkdir /app
# WORKDIR /app
# COPY . /app

# ARG APP_BASE_URL=http://localhost
# ENV APP_CONFIG_app_baseUrl=$APP_BASE_URL

# RUN yarn install --config app-config.local.yaml

# RUN apt-get update && apt-get -y install git

# RUN yarn workspace app build --config ../../app-config.local.yaml


FROM nginx:bookworm
RUN apt-get update && apt-get -y install jq && rm -rf /var/lib/apt/lists/*

ARG APP_BASE_URL=http://localhost
ENV APP_CONFIG_app_baseUrl=$APP_BASE_URL

# COPY --from=build /app/packages/app/dist /usr/share/nginx/html
COPY packages/app/dist /usr/share/nginx/html
COPY packages/app/conf/default.conf /etc/nginx/conf.d/default.conf

# COPY docker/inject-config.sh /docker-entrypoint.d/40-inject-config.sh
EXPOSE 3000
EXPOSE 80
ENV PORT 80
