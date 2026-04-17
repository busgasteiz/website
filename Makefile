#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
	@echo ----------------------

_urls: _header
	${info }
	@echo ------------------------------
	@echo [Website] http://localhost
	@echo ------------------------------

_header:
	@echo ----------
	@echo BusGasteiz
	@echo ----------

_start-command:
	@docker-compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker-compose down

restart: stop start
