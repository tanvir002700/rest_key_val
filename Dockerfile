FROM ruby:2.4.1

MAINTAINER tanvir002700@gmail.com


RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
     build-essential \
     nodejs \
    && rm -rf /var/lib/apt/lists


WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .
COPY ./config/database.yml.docker ./config/database.yml

EXPOSE 3000

CMD rails s -b 0.0.0.0
