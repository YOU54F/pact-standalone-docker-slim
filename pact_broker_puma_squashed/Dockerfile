FROM ruby:2.7.2-slim

# Installation path
ENV HOME=/pact_broker
WORKDIR $HOME
COPY pact_broker/Gemfile pact_broker/Gemfile.lock $HOME/
RUN set -ex && \
    chmod g+w $HOME && \
    useradd --home-dir $HOME --gid root --system pact_broker && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        libpq-dev && \
    gem install --no-document --minimal-deps bundler -v '~>1.0' && \
    rm -rf /var/lib/gems/*/cache && \
    bundle install --no-cache --deployment --without='development test' && \
    rm -rf vendor/bundle/ruby/*/cache .bundle/cache && \
    apt-get remove build-essential -y && \
    apt-get -qy autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER pact_broker
COPY container /
COPY pact_broker $HOME/
EXPOSE 3000
ENTRYPOINT ["bundle", "exec", "puma"]
CMD ["--config=config.rb"]