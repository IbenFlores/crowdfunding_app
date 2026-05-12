source "https://rubygems.org"

# Especificamos la versión exacta de Ruby que configuramos en tu M2
ruby "3.3.5"

# Framework principal
gem "rails", "8.1.3"

# Base de datos
gem "pg", "~> 1.1"

# Servidor web
gem "puma", ">= 5.0"

# Consumo de APIs REST
gem "faraday"

# Carga de variables de entorno (API Keys)
gem "dotenv-rails", groups: [ :development, :test ]

# Hotwire y utilidades frontend por defecto de Rails
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Rediseño de assets en Rails 8
gem "propshaft"

# Tareas en segundo plano nativas de Rails 8
gem "solid_queue"
gem "solid_cache"
gem "solid_cable"

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "bcrypt", "~> 3.1"
