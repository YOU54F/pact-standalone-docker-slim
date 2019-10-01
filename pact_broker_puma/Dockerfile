FROM ruby:2.6.5-slim

# Installation path
ENV HOME=/pact_broker
WORKDIR $HOME

# Setup pact_broker user & install application dependencies
RUN set -ex && \
    chmod g+w $HOME && \
    useradd --home-dir $HOME --gid root --system pact_broker && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        libpq-dev && \
    gem install --no-document --minimal-deps bundler -v '~>1.0' && \
    rm -rf /var/lib/gems/*/cache && \
    apt-get -qy autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Include testing utils
COPY container /

USER pact_broker

# Install Gems & puma Standalone
COPY pact_broker/Gemfile pact_broker/Gemfile.lock $HOME/
RUN set -ex && \
    bundle install --no-cache --deployment --without='development test' && \
    rm -rf vendor/bundle/ruby/*/cache .bundle/cache

USER root
RUN apt-get remove build-essential -y && \
    apt-get -qy autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER pact_broker
# Install source
COPY pact_broker $HOME/

# Start puma
EXPOSE 3000
ENTRYPOINT ["bundle", "exec", "puma"]
CMD ["--config=config.rb"]