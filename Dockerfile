FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf

RUN apt-get update && apt-get install -y inotify-tools
COPY watcher.sh /watcher.sh
RUN chmod +x /watcher.sh

CMD ["/watcher.sh"]
