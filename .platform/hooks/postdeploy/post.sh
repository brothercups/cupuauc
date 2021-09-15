#!/usr/bin/env bash
sudo ln -sfn /var/www/html/site.conf /etc/nginx/conf.d/elasticbeanstalk/
if [ ! -f /var/app/current/public/threads ]; then sudo touch /var/app/current/public/threads ; fi
cd /var/app/current/ && sudo php artisan optimize --force && sudo php artisan config:cache && sudo php artisan migrate && sudo php artisan db:seed
#sudo cp /var/app/current/site.conf /etc/nginx/conf.d/elasticbeanstalk/
sudo nginx -s reload
