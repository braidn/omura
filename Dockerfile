FROM ruby:2.7-alpine as builder

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY . .

FROM builder as dev

RUN bundle install --with development test

FROM ruby:2.7-alpine

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder Gemfile Gemfile.lock ./

CMD ["rackup"]
