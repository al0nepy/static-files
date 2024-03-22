.PHONY: build run clean

# Define variables
BINARY_NAME=app
MAIN_FILE=$(shell find ./cmd/app -name main.go)
BUILD_PATH=$(dir $(MAIN_FILE))

# Default target
build: $(BINARY_NAME)

# Build target
$(BINARY_NAME):
ifneq ($(strip $(MAIN_FILE)),)
	@echo "Building $(BINARY_NAME)"
	go build -o $(BINARY_NAME) $(MAIN_FILE)
else
	@echo "No Go files found in /cmd/app"
endif

# Run target
run: build
	@echo "Running $(BINARY_NAME)"
	./$(BINARY_NAME)

# Clean target
clean:
	@echo "Cleaning $(BINARY_NAME)"
	rm -f $(BINARY_NAME)

proto:
	@echo "Generating proto files"
	protoc --proto_path=internal/api/proto --go_out=pkg/api --go-grpc_out=pkg/api internal/api/proto/*.proto
