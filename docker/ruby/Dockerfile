FROM ruby:3.2.2

RUN apt-get update  \
    && gem install bundler rails


WORKDIR /app

ENV RDBMS_HOST=localhost

EXPOSE 3000

RUN rails new Laboratory1 --api

CMD bundle update && rails s -b 0.0.0.0 -p 3000
