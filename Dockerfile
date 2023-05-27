FROM ruby:3.1-alpine

LABEL maintainer="Syncloud Softech admin@syncloudsoft.com"

ARG MAILCATCHER_HTTP_PORT=8025
ARG MAILCATCHER_SMTP_PORT=1025

ENV HTTP_PORT=$MAILCATCHER_HTTP_PORT
ENV SMTP_PORT=$MAILCATCHER_SMTP_PORT

# install build tools
RUN apk update && apk add --no-cache build-base

# install compatible sqlite3 library
RUN gem install sqlite3 --platform=ruby

# install the mailcatcher itself
RUN gem install mailcatcher

# must use the "--foreground" flag
CMD ["sh", "-c", "mailcatcher --foreground --http-port $HTTP_PORT --ip 0.0.0.0 --smtp-port $SMTP_PORT"]

EXPOSE $MAILCATCHER_HTTP_PORT $MAILCATCHER_SMTP_PORT
