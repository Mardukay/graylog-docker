# graylog-docker

Docker compose file for full deploy graylog server with nginx and letencrypt for Ubuntu

graylog_deploy.sh - script install docker, initialising letsencrypt and starting services from docker compose file.
init-letsencrypt.sh - Create a dummy certificate, start nginx, delete the dummy and request the real certificates.
graylog-stream-api.sh - Script for multiple adding streams into graylog.

Before starting graylog_deploy.sh edit server name in nginx/conf.d/sites-available/graylog.conf for your domain.  
Edit the init-letsencrypt.sh script to add in your domain(s) and your email address.
If you’ve changed the directories of the shared Docker volumes, make sure you also adjust the data_path variable as well.

In ssl directory certificates for input and rsyslog

To Fix The Docker and UFW Security Flaw Without Disabling Iptables

<https://github.com/chaifeng/ufw-docker#to-fix-the-docker-and-ufw-security-flaw-without-disabling-iptables>

Useful links:

<https://pentacent.medium.com/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71>

<https://jswheeler.medium.com/enable-geo-location-processor-on-graylog-with-maxmind-docker-shared-volume-bd1ce39526e>

<https://dev.maxmind.com/geoip/updating-databases>

<https://habr.com/ru/articles/557200/>

<https://www.howtogeek.com/devops/how-to-use-docker-with-a-ufw-firewall/>
