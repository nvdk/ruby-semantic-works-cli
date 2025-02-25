FROM ruby:3.3.5
RUN apt-get update && apt-get install -y unixodbc unixodbc-dev
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install --system