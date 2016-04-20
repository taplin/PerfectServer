
PERFECTLIB = $(wildcard ./Packages/PerfectLib-*)
OS = $(shell uname)
Darwin_SWIFTC_FLAGS = -Xlinker -L/usr/lib -Xlinker -lcurl -Xlinker -L$(wildcard ./Packages/PerfectLib-*)/Sources/OpenSSL/osx -Xlinker -lcrypto-x86_64 -Xlinker -lssl-x86_64
Linux_SWIFTC_FLAGS = -v -Xlinker -lcurl -Xlinker -lssl -Xlinker -lcrypto -Xlinker -luuid -Xlinker .build/debug/libLinuxBridge.so
SWIFTC_FLAGS = $($(OS)_SWIFTC_FLAGS)

all: fetch
	swift build $(SWIFTC_FLAGS)

fetch:
	swift build --fetch

clean:
	swift build --clean
	rm -rf ./Packages
