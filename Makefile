DOCKER_DIR := docker
COMPOSE := docker compose -f $(DOCKER_DIR)/docker-compose.yml

.PHONY: up up-d stop rebuild destroy

up-d:
	@echo "🚀 Levantando contenedores en modo detached..."
	@cd $(DOCKER_DIR) && docker compose up -d

up:
	@echo "🚀 Levantando contenedores en modo detached..."
	@cd $(DOCKER_DIR) && docker compose up

stop:
	@echo "🛑 Deteniendo contenedores..."
	@cd $(DOCKER_DIR) && docker compose stop

rebuild:
	@echo "🔥 Eliminando imagen asociada al contenedor..."
	@cd $(DOCKER_DIR) && \
	containers=$$(docker compose ps -a -q) && \
	for c in $$containers; do \
		img=$$(docker inspect --format='{{.Image}}' $$c); \
		echo "Eliminando imagen asociada a $$c ($$img)..."; \
		docker rm -f $$c 2>/dev/null || true; \
		docker rmi -f $$img 2>/dev/null || true; \
	done; \
	echo "✅ Imágenes asociadas eliminadas."
	@echo "🚀 Levantando contenedores en modo detached..."
	@cd $(DOCKER_DIR) && docker compose up

destroy:
	@echo "🔥 Eliminando imagen asociada al contenedor..."
	@cd $(DOCKER_DIR) && \
	containers=$$(docker compose ps -a -q) && \
	for c in $$containers; do \
		img=$$(docker inspect --format='{{.Image}}' $$c); \
		echo "Eliminando imagen asociada a $$c ($$img)..."; \
		docker rm -f $$c 2>/dev/null || true; \
		docker rmi -f $$img 2>/dev/null || true; \
	done; \
	echo "✅ Imágenes asociadas eliminadas."