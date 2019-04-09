# docker-nginx-autoreload

Nginx + Docker with autoreload on config changes. Great for local development.

---

We build a nginx container that uses `inotifywait` to check for `nginx.conf` changes.  
This allows us to mount the config to the container for easy editing.  
Every time you hit save, `watcher.sh` calls `nginx -s reload`.  

To get started:

```
make build
make start
```
