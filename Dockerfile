FROM ruby:3.1.2-alpine AS builder
RUN apk add --no-cache nodejs npm bash curl musl-dev libc-dev make gcc sqlite-dev
ENV APP_DIR=/app

RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}
ARG GITHUB_USERNAME
ARG GITHUB_PACKAGES_TOKEN

COPY build.js ./
COPY react-shim.js ./
COPY Gemfile Gemfile.lock ./
COPY package.json package-lock.json ./

RUN bundle config --local path ${APP_DIR}/vendor/bundle && bundle install --jobs 8

RUN npm install

COPY public/ ./public/
COPY lib/ ./lib/
COPY app.rb .

COPY src/ ./src/
RUN npm run build

COPY config.ru .
COPY views/ ./views
COPY scripts/entrypoint.sh ./

RUN adduser -h ${APP_DIR} -s /bin/false -D app_user
RUN chown -R app_user:app_user ${APP_DIR}
USER app_user

FROM ruby:3.1.2-alpine
RUN apk add --no-cache sqlite-dev
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/public/ ./public
COPY --from=builder /app/app.rb .
COPY --from=builder /app/config.ru .
COPY --from=builder /app/entrypoint.sh /app
COPY --from=builder /app/views ./views
COPY --from=builder /app/lib ./lib
COPY --from=builder /app/vendor ./vendor
COPY --from=builder /app/Gemfile .
RUN bundle config --local path /app/vendor/bundle
CMD [ "/app/entrypoint.sh" ]
RUN adduser -h /app -s /bin/false -D app_user
RUN chown -R app_user:app_user /app
USER app_user
