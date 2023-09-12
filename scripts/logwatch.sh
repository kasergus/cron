#!/bin/bash

sudo logwatch --detail Med --mailto root --service sshd vsftdp # сервис xrdp logwatch по какой-то причине обработать не может
crontab < echo "MAILTO=root 0 8 * * *" # создание задачи в cron