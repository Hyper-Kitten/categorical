FROM ruby:3.1.1-alpine

RUN apk update && apk add less build-base postgresql-dev chromium chromium-chromedriver gcompat

RUN mkdir /app
WORKDIR /app

COPY categorical.gemspec Gemfile Gemfile.lock ./
COPY ./lib/categorical/version.rb ./lib/categorical/
RUN bundle install

COPY . .

LABEL maintainer="Josh Klina"

CMD puma -C config/puma.rb
