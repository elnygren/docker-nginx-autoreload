IMAGE_NAME="elnygren/docker-nginx-autoreload"
CONTAINER_NAME="docker-nginx-autoreload"

# "public API"

.PHONY: start
start:
	docker run -it --rm \
	--name $(CONTAINER_NAME) -p 8080:80 \
	-v $(PWD)/nginx.conf:/etc/nginx/nginx.conf \
	$(IMAGE_NAME)

.PHONY: clean
clean: stop rm

.PHONY: validate
validate:
	docker run --rm -t -a stdout \
	-v $(PWD)/nginx.conf:/etc/nginx/nginx.conf:ro \
	nginx:latest \
	nginx -c /etc/nginx/nginx.conf -t

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: run
run:
	docker run --name $(CONTAINER_NAME) -p 8080:80 -d $(IMAGE_NAME)

.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME)

.PHONY: rm
rm:
	docker rm $(CONTAINER_NAME)

.PHONY: rmi
rmi:
	docker rmi $(IMAGE_NAME)
