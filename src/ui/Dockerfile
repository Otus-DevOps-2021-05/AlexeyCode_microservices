FROM alpine
RUN apk update \
  && apk add ruby-full ruby-dev build-base \
  && gem install bundler:1.17.2 --no-doc

ENV APP_HOME /app

WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
