source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.7'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot', '~> 4.8', require: false
  gem 'rubocop', '~> 0.66.0', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec', '~> 3.7'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
