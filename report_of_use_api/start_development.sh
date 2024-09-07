#!/bin/sh
rm -f tmp/pids/server.pid

gem install rails
bundle install --jobs 5 --retry 5

rails s -b 0.0.0.0 -p 8000
