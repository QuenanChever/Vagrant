#!/bin/bash

cd /var/www/sites/sylius

sed -i "s/database_password: '%env(SYLIUS_DATABASE_PASSWORD)%'/database_password: vagrant/g" app/config/parameters.yml

# Sylius setup
php bin/console sylius:install --no-interaction
yarn install
yarn run gulp

# TV setup
php bin/console sylius:theme:assets:install --symlink
php bin/console tv:install:setup
php bin/console tv:import:products
