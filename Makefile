IMAGE_NAME = web-nodejs-builder
IMAGE_TAG = latest

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

test:
	# "Check NodeJS"
	docker run --rm -i ${IMAGE_NAME}:${IMAGE_TAG} node --version
	
	# "Check Yarn"
	docker run --rm -i ${IMAGE_NAME}:${IMAGE_TAG} yarn --version
	
	# "Check awscli"
	docker run --rm -i ${IMAGE_NAME}:${IMAGE_TAG} yarn --version
	
	# "Check java"
	docker run --rm -i ${IMAGE_NAME}:${IMAGE_TAG} java -version
	
	# "Check chrome browser"
	docker run --rm -i ${IMAGE_NAME}:${IMAGE_TAG} /opt/chrome-linux/chrome --version

push:
	aws ecr get-login --no-include-email | sh
	docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_REPO_NAME}:${IMAGE_TAG}
