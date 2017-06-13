FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y apt-transport-https
RUN mkdir /rails
WORKDIR /rails
ADD Gemfile /rails/Gemfile
ADD Gemfile.lock /rails/Gemfile.lock
RUN bundle install
ADD . /rails
EXPOSE 3000

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y yarn

CMD yarn && \
    ./bin/setup && \
    ./bin/rails s
