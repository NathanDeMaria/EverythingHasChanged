FULL_DIR=$(shell realpath $(DIRECTORY))


build:
	docker build -t requirements-generator .

generate: build
	docker run --rm -v $(FULL_DIR):/env/ requirements-generator
