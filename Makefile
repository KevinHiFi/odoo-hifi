DOCKER_USER ?= root
DOCKER_NAME ?= hifi_extra_odoo
ADDON_DIR ?= /mnt/extra-addons
DB_NAME ?= odoo_db
DB_HOST ?= hifi_extra_postgres
DB_PORT ?= 5432
DB_USER ?= odoo_user
DB_PASSWORD ?= hdVg4SQB2pEuUFaYLtGzDbn8N7JCk6Zf9sKTAWwjmMPyrevRH3
ODOO_TEMP_PORT ?= 8070
PATH_TO_DOCKER_CONFIGURATION ?= ./docker/docker-compose.yml

define run_odoo_tests
	docker exec -u ${DOCKER_USER} -it ${DOCKER_NAME} \
	    odoo --addons-path=${ADDON_DIR} \
	         --db-filter=${DB_NAME} \
	         -d ${DB_NAME} \
	         --db_host=${DB_HOST} \
	         --db_port=${DB_PORT} \
	         --db_user=${DB_USER} \
	         --db_password=${DB_PASSWORD} \
	         --test-enable \
	         --init=$1 \
	         --http-port=${ODOO_TEMP_PORT} \
	         --stop-after-init 2>&1 | grep "odoo.tests.result"
endef

define update_addons
    docker exec -u ${DOCKER_USER} -it ${DOCKER_NAME} \
        odoo --addons-path=${ADDON_DIR} \
             --db-filter=${DB_NAME} \
             -d ${DB_NAME} \
             --db_host=${DB_HOST} \
             --db_port=${DB_PORT} \
             --db_user=${DB_USER} \
             --db_password=${DB_PASSWORD} \
             --init=$1 \
             --http-port=${ODOO_TEMP_PORT} \
             --stop-after-init
endef

define start_docker_container
    docker compose -f ${PATH_TO_DOCKER_CONFIGURATION} up -d
endef

define stop_docker_container
    docker compose -f ${PATH_TO_DOCKER_CONFIGURATION} down
endef

define status_docker_container
	docker compose -f ${PATH_TO_DOCKER_CONFIGURATION} ps
endef

define log_docker_container
    docker compose -f ${PATH_TO_DOCKER_CONFIGURATION} logs -f $1
endef

define clean_docker_container
    docker system prune -a --volumes --force
    rm -rf docker/data/
endef

run-odoo-tests: ## run odoo tests for module
	$(call run_odoo_tests,company_configuration)
	$(call run_odoo_tests,purchase_configuration)
	$(call run_odoo_tests,sale_configuration)
	$(call run_odoo_tests,stock_configuration)
	$(call run_odoo_tests,website_configuration)

update-addons: ## update custom odoo addons
	$(call update_addons,company_configuration)
	$(call update_addons,purchase_configuration)
	$(call update_addons,sale_configuration)
	$(call update_addons,stock_configuration)
	$(call update_addons,website_configuration)

start-docker-container: ## starts all Docker container defined in configuration
	$(call start_docker_container)

stop-docker-container: ## stops all Docker container defined in configuration
	$(call stop_docker_container)

restart-docker-container: ## restart all Docker container defined in configuration
	$(call stop_docker_container)
	$(call start_docker_container)

status-docker-container: ## show status of all stated Docker container defined in configuration
	$(call status_docker_container)

log-docker-container: ## show log of the Docker container by the given name, name=odoo
	$(call log_docker_container,$(name))

clean-docker-container: ## clean Docker container and remove data folder (be careful!)
	$(call stop_docker_container)
	$(call clean_docker_container)

help: ## show this help
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {\
	printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
	}' $(MAKEFILE_LIST)

.DEFAULT_GOAL=help

.PHONY=help
