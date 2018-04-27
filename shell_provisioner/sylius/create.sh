#!/bin/bash

cd /var/www/sites

mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

git clone git@github.com:devl-hop/shop-technique-voile.git ./sylius
cd sylius
composer install
