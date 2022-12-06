FROM ruby:3.1.2 as build

ENV JEKYLL_ENV: production
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN bundle install && \
    bundle exec jekyll build

FROM nginx:stable

COPY --from=build /usr/src/app/_site/ /usr/share/nginx/html/