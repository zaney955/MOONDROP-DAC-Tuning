.PHONY: build
build: bin/echo_probe

bin/echo_probe: tools/echo_probe.c
	mkdir -p bin
	clang -Wall -Wextra -framework IOKit -framework CoreFoundation $< -o $@
