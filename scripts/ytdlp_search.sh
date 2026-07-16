#!/usr/bin/env bash
SEARCH_VID() {
  yt-dlp "https://www.youtube.com/results?search_query=$1" \
    --flat-playlist --playlist-items 1:20 --print \
    $'%(thumbnails.0.url)s\t%(title)s\t%(uploader)s\t%(view_count)s\t%(url)s\t%(duration_string)s' \
    --no-warnings \
    | grep --extended-regexp --invert-match 'playlist|channel'
}
RENDER_VID_INFO() {
  local thumbnail="$1" title="$2" uploader="$3" views="$4" duration="$6"
  curl --silent "$thumbnail" | chafa --size=36x15 --clear
  [[ "$duration" == "NA" ]] && duration="--:--"
  printf " \033[1m%.55s\033[0m\n" "$title"
  printf " \033[2m%s • %'d views\033[0m\n" "$uploader" "$views"
  printf " \033[2m%s\033[0m\n" "$duration"
}
export -f SEARCH_VID RENDER_VID_INFO
fzf \
  --layout reverse \
  --disabled \
  --with-shell 'bash -c' \
  --bind 'start:reload:SEARCH_VID fzf' \
  --bind 'change:reload(sleep 0.3; SEARCH_VID {q} || true)+change-header:enter<mpv>|C-o<browser>|C-y<copy URL>' \
  --bind 'load:first' \
  --delimiter '\t' \
  --with-nth 2 \
  --preview 'RENDER_VID_INFO {1} {2} {3} {4} {5} {6}' \
  --preview-window 'right:50%:wrap' \
  --bind 'enter:execute-silent(mpv --really-quiet {5} &)' \
  --bind 'ctrl-o:execute-silent(xdg-open {5} 2>/dev/null)+change-header:▶ Opened in browser' \
  --bind 'ctrl-y:execute-silent(echo {5} | xclip -selection clipboard)+change-header:✓ Copied!' \
  --header $'enter<mpv> | C-o<browser> | C-y<copy>'
