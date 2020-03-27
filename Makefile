APP_NAME= $(notdir $(PWD))

build:
	docker build -t $(APP_NAME) -f Dockerfile .

run:
	docker run --rm --name $(APP_NAME) -it -d -p 8890:8888 -p 4040:4040 -v $(HOME)/github:/root/github $(APP_NAME)

up: build run

down:
	docker stop $(APP_NAME)

notebook: build run
	docker exec -it $(APP_NAME) jupyter lab --port=8888 --ip=0.0.0.0 --allow-root /root/github


