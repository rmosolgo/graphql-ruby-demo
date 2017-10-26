FROM ruby:2.3.1-onbuild

RUN apt-get update && apt-get -y install node

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
