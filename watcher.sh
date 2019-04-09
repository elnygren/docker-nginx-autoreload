#!/bin/bash

nginx_watch () {
  while inotifywait -e modify /etc/nginx/nginx.conf; do
      echo "Watcher: /etc/nginx/nginx.conf changed, reloading (nginx -s reload) ..."
      nginx -s reload
  done
}

nginx_watch &

nginx -g "daemon off;"
