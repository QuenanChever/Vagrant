#!/bin/bash

# Avoid SSH issues
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

# Create TV repo
cd /var/www/sites
git clone git@github.com:devl-hop/shop-technique-voile.git ./sylius
cd ./sylius
composer config --global process-timeout 2000
composer install --no-progress -n
