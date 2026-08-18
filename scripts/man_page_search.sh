 man --apropos . | dmenu -l 30 | awk '{print $1}' | xargs man --troff-device=pdf | zathura -
