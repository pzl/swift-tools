TARGET=


all: swift-$(TARGET)

swift-$(TARGET):
	swift $(TARGET)

release:
	swift $(TARGET) release

run: 
	podman run --rm -it swift-$(TARGET)

test:
	echo "not filled in yet"

clean:
	podman rmi swift-$(TARGET)


.PHONY: clean test release run
