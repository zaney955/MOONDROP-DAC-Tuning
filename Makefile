.PHONY: build test
build: bin/echo_probe bin/echo_apply_plan

bin/echo_probe: tools/echo_probe.c
	mkdir -p bin
	clang -Wall -Wextra -framework IOKit -framework CoreFoundation $< -o $@

bin/echo_apply_plan: tools/echo_apply_plan.c
	mkdir -p bin
	clang -Wall -Wextra -framework IOKit -framework CoreFoundation $< -o $@

bin/test_echo_probe: tools/test_echo_probe.c tools/echo_probe.c tools/echo_apply_plan.c
	mkdir -p bin
	clang -Wall -Wextra -Werror -framework IOKit -framework CoreFoundation $< -o $@

# All tests use fake device I/O and do not access USB.
test: bin/test_echo_probe
	python3 -m unittest discover -s tools -p 'test_*.py'
	bin/test_echo_probe
