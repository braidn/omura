# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'hanami-api', '~> 0.1'
gem 'sorbet', :group => :development
gem 'sorbet-runtime'
gem 'dry-events'

group :test do
  gem 'minitest-matchers_vaccine'
  gem 'mocha'
end
