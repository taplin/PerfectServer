
PERFECTLIB = $(wildcard ./Packages/PerfectLib-*)

all: fetch
	swift build \
		-Xlinker -L/usr/lib \
		-Xlinker -lcurl \
		-Xlinker -L$(wildcard ./Packages/PerfectLib-*)/Sources/OpenSSL/osx \
		-Xlinker -lcrypto-x86_64 \
		-Xlinker -lssl-x86_64

fetch:
	swift build --fetch

clean:
	swift build --clean
	rm -rf ./Packages
