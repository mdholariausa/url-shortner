#!/bin/sh

rbenv init
rbenv install "$(cat .ruby-version)"
gem install bundle
bundle install
