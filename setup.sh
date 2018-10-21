#!/bin/sh

rbenv init
rbenv install "$(cat .ruby-version)"
bundle install
