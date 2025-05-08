# ---- Builder Stage ----
FROM ruby:3.3.8-alpine AS builder

RUN apk add --no-cache build-base
RUN gem install rubocop rubocop-rails rubocop-performance rubocop-rspec rubocop-rspec_rails rubocop-factory_bot

# ---- Final Stage ----
FROM ruby:3.3.8-alpine
RUN apk add --no-cache tini

COPY --from=builder /usr/local/bundle /usr/local/bundle

WORKDIR /app
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bundle/bin/rubocop", "--parallel", "--format", "github"]
