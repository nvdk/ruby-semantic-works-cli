FROM ruby:3.3.5
RUN apt-get update && apt-get install -y unixodbc unixodbc-dev
RUN apt-get update && apt-get install -y openjdk-17-jdk wget unzip xz-utils gzip bzip2 \
    && wget -qO- https://downloads.apache.org/jena/binaries/apache-jena-5.5.0.tar.gz | tar xz -C /opt && \
    mv /opt/apache-jena-5.5.0 /opt/jena && \
    ln -s /opt/jena/bin/riot /usr/local/bin/riot
RUN bundle config --global frozen 1
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install --system