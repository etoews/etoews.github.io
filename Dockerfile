FROM ruby:3.3 AS builder

COPY proxy.pem /usr/local/share/ca-certificates/proxy.crt
RUN update-ca-certificates

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
  && rm -rf /var/lib/apt/lists/*

ENV BUNDLE_PATH=/usr/local/bundle

WORKDIR /srv/jekyll

COPY Gemfile ./

RUN bundle install

FROM ruby:3.3

ENV BUNDLE_PATH=/usr/local/bundle

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /srv/jekyll/Gemfile.lock /srv/jekyll/Gemfile.lock

WORKDIR /srv/jekyll

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--future", "--drafts", "--force_polling", "--host", "0.0.0.0"]
