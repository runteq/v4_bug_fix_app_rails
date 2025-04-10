FROM ruby:3.2
RUN apt-get update -qq && \
    apt-get install -y nodejs build-essential libsqlite3-dev
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
