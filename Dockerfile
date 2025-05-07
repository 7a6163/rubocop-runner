FROM ruby:3.3-alpine

WORKDIR /app

RUN gem install bundler:2.6.8
