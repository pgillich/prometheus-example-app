VERSION:=$(shell cat VERSION)

IMAGE_NAME ?= prometheus-example-app

LDFLAGS="-X main.appVersion=$(VERSION)"

.PHONY : all build image

all: build

build:
	CGO_ENABLED=0 go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go

image:
	docker build -t "ghcr.io/pgillich/$(IMAGE_NAME):$(VERSION)" .
