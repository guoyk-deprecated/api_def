#!/bin/bash

rm *.gem

gem build ./api_def.gemspec

sudo gem install -l *.gem
