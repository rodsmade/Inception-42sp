# PATHS
VOLUMES_PATH = /home/roaraujo/data

## --------------------------------------------- ## ALL SERVICES AT ONCE -------
start: volumes hosts
	docker-compose -f srcs/docker-compose.yml up --detach --build --force-recreate

volumes:
	sudo mkdir -p $(VOLUMES_PATH)/wordpress-volume $(VOLUMES_PATH)/mariadb-volume

hosts: /etc/hosts
	@sudo grep "roaraujo.42.fr" /etc/hosts || sudo sh -c 'echo "127.0.0.1 roaraujo.42.fr" >> /etc/hosts'
	@sudo grep "www.roaraujo.42.fr" /etc/hosts || sudo sh -c 'echo "127.0.0.1 www.roaraujo.42.fr" >> /etc/hosts'

stop:
	docker-compose -f srcs/docker-compose.yml down

restart: stop start

clean: clean-nginx clean-mariadb clean-wordpress

fclean: clean fclean-nginx fclean-mariadb fclean-wordpress
	sudo rm -rf $(VOLUMES_PATH)
	@chmod +x scripts/conditional-delete-volume.sh
	@./scripts/conditional-delete-volume.sh wordpress-vol
	@./scripts/conditional-delete-volume.sh mariadb-vol

frestart: fclean start

## --------------------------------------------------------- NGINX -------------
start-nginx: volumes
	docker-compose -f srcs/docker-compose.yml up nginx --detach --build --force-recreate

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
start-mariadb: volumes
	docker-compose -f srcs/docker-compose.yml up mariadb --detach --build --force-recreate

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
start-wordpress: volumes
	docker-compose -f srcs/docker-compose.yml up wordpress --detach --build --force-recreate

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