DOCKERHUB_REPO=gliderlabs/dockerhub-tag
GITHUB_REPO=progrium/dockerhub-tag
DOCKERFILE_LOCATION=/
VERSION=$(shell cat VERSION)

deps:
	go get github.com/progrium/gh-release/...
	go get github.com/progrium/dockerhub-tag

release:
	gh-release create $(GITHUB_REPO) $(VERSION)
	dockerhub-tag create $(DOCKERHUB_REPO) $(VERSION) v$(VERSION) $(DOCKERFILE_LOCATION)
