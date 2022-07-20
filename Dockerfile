# Dockerfile development version
FROM ruby:3.1.2 AS uf-development

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY uf/ .
RUN gem install rails bundler
RUN bundle install

# Start server
EXPOSE 3000
CMD bundle exec puma