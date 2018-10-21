#!/bin/sh

cd ..
rbenv init
rbenv install "$(cat .ruby-version)"
bundle install
