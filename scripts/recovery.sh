#!/bin/bash

sudo pacman -Sy --noconfirm cron # установка cron на случай если не установлен
echo "30 18 * * 4 $(pwd)/recovery.sh" > /tmp/crontask.txt && \
	crontab < /tmp/crontask.txt && \  # посольку ввод должен происходить из файла, то пришлось создать временнный текстовый документ
	rm /tmp/crontask.txt
sudo systemctl enable cronie && sudo systemctl start cronie
sudo tar cpf "$HOME/archive/created_on_$(date '+%d-%B-%y').tar" /home /etc/ssh /etc/vsftpd.conf /var/log  # создание резервной копии системы в соответствии с требованиями задачи
