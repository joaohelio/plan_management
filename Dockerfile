FROM ruby:3.2.1

RUN apt-get update -qq && apt-get install -y cmake

WORKDIR /app
COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN bundle install

COPY . /app

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "config.ru"]
