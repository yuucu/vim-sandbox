
build:
	docker build -t vim-sandbox .

run:
	make build && make docker_run

docker_run:
	docker run --rm -it --name vim-sandbox -v ${PWD}/vim:/root/.vim vim-sandbox

