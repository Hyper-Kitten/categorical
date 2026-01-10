FROM ruby:4.0.0-alpine

RUN apk update && apk add less build-base postgresql-dev chromium chromium-chromedriver gcompat git yaml-dev

RUN mkdir /app
WORKDIR /app

COPY categorical.gemspec Gemfile ./
COPY ./lib/categorical/version.rb ./lib/categorical/
RUN bundle install

COPY . .

LABEL maintainer="Josh Klina"

CMD puma -C config/puma.rb
