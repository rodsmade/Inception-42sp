start:
	docker-compose -f srcs/docker-compose.yml up --detach

stop:
	docker-compose -f srcs/docker-compose.yml down

restart: stop start

clean:
	@chmod +x scripts/conditional-stop.sh
	@./scripts/conditional-stop.sh
	@chmod +x scripts/conditional-remove.sh
	@./scripts/conditional-remove.sh

# TODO:
fclean: clean
	docker rmi nginx-inception