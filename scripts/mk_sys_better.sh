#!/bin/bash

# Обновление системы и установка программ
sudo pacman -Sy
sudo pacman -S apache php-apache python3 openssh kitty sublime-text-4 ttf-jetbraiins-mono # зачастую к apache устанавливают ещё и php 

# Активация и запуск необходимых демонов
sudo systemctl enable httpd sshd
sudo systemctl start httpd sshd

# Настраиваем тему для kitty
kitty +kitten themes Catppuccin-Macchiato 

# А тут по сложнее - облагораживаем sublime text
sublime_path="$HOME/.config/sublime-text"  # инициализация переменной
yay -Sy sublime-text-4 --answerdiff n --answerclean n  # установка непосредственно sublime text
mkdir $sublime_path/Installed\ Packages  # создание необходимых папок
mkdir -p $sublime_path/Packages/User  # поскольку мы устанвливаем package manager вручную - нам надо вручную создать необходимые папки
mkdir $sublime_path/Packages/Catppuccin
git clone https://github.com/catppuccin/sublime-text $sublime_path/Packages/Catppuccin  # клонирование catppuccin
wget https://packagecontrol.io/Package%20Control.sublime-package -P $sublime_path/Installed\ Packages  # скачивание package control (для переключения между темами и скачивания других пакетов)
echo " {
    \"color_scheme\": \"Catppuccin Macchiato.sublime-color-scheme\",
    \"theme\": \"Adaptive.sublime-theme\",
    \"dark_color_scheme\": \"Breakers.sublime-color-scheme\",
    \"light_color_scheme\": \"Monokai.sublime-color-scheme\",
    \"ignored_packages\":
    [],
    \"font_face\": \"JetBrains Mono\",
    \"font_size\": 13,

    \"translate_tabs_to_spaces\": true,
    \"detect_identation\": true,
}" > $sublime_path/Packages/User/Preferences.sublime-settings  # Заливаем конфиг (мой кастомный чисто для визуала и конвертации табуляций в пробелы)
