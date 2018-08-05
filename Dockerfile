FROM ruby:2.4.4-alpine

RUN apk --update --upgrade add ruby ruby-bundler
RUN rm -rf /var/cache/apk/*

ADD https://github.com/sequenceiq/docker-alpine-dig/releases/download/v9.10.2/dig.tgz /tmp/
WORKDIR /usr/local/bin
RUN tar xvfz /tmp/dig.tgz && rm -f /tmp/dig.tgz

WORKDIR /home
COPY Gemfile Gemfile.lock main.rb /home/
RUN bundle install

CMD ["bundle", "exec", "ruby", "main.rb"]
