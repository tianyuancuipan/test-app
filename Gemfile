source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
gem 'bootstrap', '~> 4.1.3'
gem 'puma', '3.9.1'
gem 'sassc'
gem 'uglifier', '3.2.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks', '5.0.1'
gem 'jbuilder', '2.7.0'
gem 'sprockets', '~> 3.5', '>= 3.5.2'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '1.2.2'
gem 'mini_magick', '4.7.0'
gem "bootstrap_form", ">= 4.0.0.alpha1"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
end

group :development do
  gem 'web-console', '3.5.1'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest', '5.10.3'
  gem 'minitest-reporters', '1.1.14'
end

group :production do
  gem 'pg',  '0.20.0'
  gem 'fog-aws', '3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
