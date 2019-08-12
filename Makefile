FULL_DIR=$(shell realpath $(DIRECTORY))


build:
	docker build -t requirements-generator .

generate: build
ifndef DIRECTORY
	$(error "Must set DIRECTORY=<some dir>")
endif
	docker run --rm -v $(FULL_DIR):/env/ requirements-generator
