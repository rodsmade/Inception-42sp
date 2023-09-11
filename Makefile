## --------------------------------------------- ## ALL SERVICES AT ONCE -------
start:
	docker-compose -f srcs/docker-compose.yml up --detach

stop:
	docker-compose -f srcs/docker-compose.yml down

restart: stop start

clean: clean-nginx clean-mariadb clean-wordpress

fclean: clean fclean-nginx fclean-mariadb fclean-wordpress

frestart: fclean start

## --------------------------------------------------------- NGINX -------------
start-nginx:
	docker-compose -f srcs/docker-compose.yml up nginx --detach

stop-nginx:
	docker-compose -f srcs/docker-compose.yml down nginx

restart-nginx: stop-nginx start-nginx

clean-nginx: # stops and deletes containers
	@chmod +x scripts/conditional-stop-container.sh
	@./scripts/conditional-stop-container.sh nginx-inception-ctnr
	@chmod +x scripts/conditional-delete-container.sh
	@./scripts/conditional-delete-container.sh nginx-inception-ctnr

fclean-nginx: clean-nginx # deletes images
	@chmod +x scripts/conditional-delete-image.sh
	@./scripts/conditional-delete-image.sh nginx-inception-img

frestart-nginx: fclean-nginx start-nginx

## ------------------------------------------------------- MARIADB -------------
start-mariadb:
	docker-compose -f srcs/docker-compose.yml up mariadb --detach

stop-mariadb:
	docker-compose -f srcs/docker-compose.yml down mariadb

restart-mariadb: stop-mariadb start-mariadb

clean-mariadb: # stops and deletes containers
	@chmod +x scripts/conditional-stop-container.sh
	@./scripts/conditional-stop-container.sh mariadb-inception-ctnr
	@chmod +x scripts/conditional-delete-container.sh
	@./scripts/conditional-delete-container.sh mariadb-inception-ctnr

fclean-mariadb: clean-mariadb # deletes images
	@chmod +x scripts/conditional-delete-image.sh
	@./scripts/conditional-delete-image.sh mariadb-inception-img

frestart-mariadb: fclean-mariadb start-mariadb

## -------------------------------------------------------- WORDPRESS ----------
start-wordpress:
	docker-compose -f srcs/docker-compose.yml up wordpress --detach

stop-wordpress:
	docker-compose -f srcs/docker-compose.yml down wordpress

restart-wordpress: stop-wordpress start-wordpress

clean-wordpress: # stops and deletes containers
	@chmod +x scripts/conditional-stop-container.sh
	@./scripts/conditional-stop-container.sh wordpress-inception-ctnr
	@chmod +x scripts/conditional-delete-container.sh
	@./scripts/conditional-delete-container.sh wordpress-inception-ctnr

fclean-wordpress: clean-wordpress # deletes images
	@chmod +x scripts/conditional-delete-image.sh
	@./scripts/conditional-delete-image.sh wordpress-inception-img

frestart-wordpress: fclean-wordpress start-wordpress

.PHONY: start stop restart clean fclean frestart \
		start-nginx stop-nginx restart-nginx clean-nginx fclean-nginx frestart-nginx \
		start-mariadb stop-mariadb restart-mariadb clean-mariadb fclean-mariadb frestart-mariadb \