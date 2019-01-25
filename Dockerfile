FROM ruby:2.6-alpine

RUN apk --no-cache add \
  zlib-dev \
  build-base \
  libxml2-dev \
  libxslt-dev \
  readline-dev \
  libffi-dev \
  yaml-dev \
  zlib-dev \
  libffi-dev \
  cmake

RUN gem install bundler
RUN mkdir /app
WORKDIR /app
COPY . /app

RUN bundle install
RUN mkdir -p /public
RUN echo "<script>window.location= '/en'</script>" >> /public/index.html
RUN bundle exec jekyll build --destination /public/en
