SHELL := /bin/bash

.PHONY: bootstrap start-local stop-local build lint test clean

bootstrap:
	./scripts/bootstrap.sh

start-local:
	./scripts/start-local.sh

stop-local:
	docker compose down

build:
	./scripts/build-all.sh

lint:
	pnpm lint

test:
	pnpm test

clean:
	docker compose down -v
	pnpm store prune
