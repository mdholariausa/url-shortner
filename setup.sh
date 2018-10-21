#!/bin/sh

rbenv init
cd ..
rbenv install "$(cat .ruby-version)"
bundle install
