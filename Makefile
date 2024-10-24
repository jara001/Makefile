# Self-documenting Makefile
# Version: s9
# Source: https://github.com/jara001/Makefile
# Originally:
# Self-documenting Makefile by prwhite
# https://gist.github.com/prwhite/8168133
# https://gist.github.com/prwhite/8168133#gistcomment-1716694
# https://gist.github.com/prwhite/8168133#gistcomment-1737630

.PHONY: build develop install uninstall reinstall

help: ## Show this help message.
	@echo "Usage: make [target] ..."
	@echo
	@echo -n "Targets:"
	@grep --color=auto -F "## " $(MAKEFILE_LIST) | grep --color=auto -F -v grep | sed -e "s/\\$$//" | sed -e "s/[^:]*##//" | awk -F: '{ if (width < length($$1)) { width=length($$1) }; key[NR] = $$1; value[NR] = $$2; } END { format = sprintf("%%-%ds   %%s\n", width); for (;i <= NR; i++) { printf format, key[i], value[i]; } }'
	@grep "##@[^ \"]*" $(MAKEFILE_LIST) | grep --color=auto -F -v grep | sed -e "s/^.*##@\\([a-zA-Z][a-zA-Z]*\\).*\$$/\1/" | sed "/^\\$$/d" | sort | uniq | { while read line; do echo; echo -n $$line targets:; grep "##@$$line" $(MAKEFILE_LIST) | sed -e "s/[^:]*##@$$line//" | awk -F: '{ if (width < length($$1)) { width=length($$1) }; key[NR] = $$1; value[NR] = $$2; } END { format = sprintf("%%-%ds   %%s\n", width); for (;i <= NR; i++) { printf format, key[i], value[i]; } }'; done }


build: ##@Build Build a Python3 wheel.
	python3 setup.py build bdist_wheel --python-tag py3

develop: ##@Developer Install the package as link to this repository.
	python3 setup.py develop --user

install: ##@Install Install the package for current user.
	python3 setup.py install --user

uninstall: ##@Install Uninstall the package.
	python3 -m pip uninstall '$(notdir $(CURDIR))'

reinstall: ##@Install Reinstall the package
reinstall: uninstall install
