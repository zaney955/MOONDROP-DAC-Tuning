.PHONY: build test editor
build: bin/echo_probe bin/echo_apply_plan bin/echo_gain_probe bin/echo_filter_probe

editor:
	python3 tools/editor.py --open

bin/echo_probe: tools/echo_probe.c
	mkdir -p bin
	clang -Wall -Wextra -framework IOKit -framework CoreFoundation $< -o $@

bin/echo_apply_plan: tools/echo_apply_plan.c
	mkdir -p bin
	clang -Wall -Wextra -framework IOKit -framework CoreFoundation $< -o $@

bin/echo_gain_probe: tools/echo_gain_probe.c
	mkdir -p bin
	clang -Wall -Wextra -Werror -framework IOKit -framework CoreFoundation $< -o $@

bin/echo_filter_probe: tools/echo_filter_probe.c tools/echo_gain_probe.c
	mkdir -p bin
	clang -Wall -Wextra -Werror -framework IOKit -framework CoreFoundation $< -o $@

bin/test_echo_probe: tools/test_echo_probe.c tools/echo_probe.c tools/echo_apply_plan.c
	mkdir -p bin
	clang -Wall -Wextra -Werror -framework IOKit -framework CoreFoundation $< -o $@

bin/test_echo_gain_probe: tools/test_echo_gain_probe.c tools/echo_gain_probe.c
	mkdir -p bin
	clang -Wall -Wextra -Werror -framework IOKit -framework CoreFoundation $< -o $@

bin/test_echo_filter_probe: tools/test_echo_filter_probe.c tools/echo_filter_probe.c tools/echo_gain_probe.c
	mkdir -p bin
	clang -Wall -Wextra -Werror -framework IOKit -framework CoreFoundation $< -o $@

# All tests use fake device I/O and do not access USB.
test: bin/test_echo_probe bin/test_echo_gain_probe bin/test_echo_filter_probe
	python3 -m unittest discover -s tools -p 'test_*.py'
	bin/test_echo_probe
	bin/test_echo_gain_probe
	bin/test_echo_filter_probe
