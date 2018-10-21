#!/bin/sh

rbenv init
rbenv install "$(cat .ruby-version)"

sudo sudo yum update -y
sudo yum install mysql56

sudo yum install mysql56-devel


gem install bundle
bundle install

rake db:create
rake db:migrate
