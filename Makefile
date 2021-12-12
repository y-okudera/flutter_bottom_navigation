.PHONY: help
help: ## Show this usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: dependencies
dependencies: ## Install packages.
	fvm install
	fvm flutter clean
	fvm flutter packages pub get

.PHONY: analyze
analyze: ## Linting
	fvm flutter analyze

.PHONY: format
format: ## Formatting
	fvm flutter format lib/

.PHONY: build-runner
build-runner: ## Generate code dynamically with annotations.
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run
run: ## Run app.
	fvm flutter run --target lib/main.dart
	
.PHONY: run-%
run-%: ## Run app. Use specific device id.
	fvm flutter run --target lib/main.dart -d ${@:run-%=%}
