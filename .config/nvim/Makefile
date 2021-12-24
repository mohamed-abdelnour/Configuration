.PHONY: check_plugin_order clean dummy

VPATH = lua

define get_plugins
rg -A1 'use' 'lua/init_plugins.lua' |\
	sed -En 's/.*"(.+)".*/\1/p' |\
	rev |\
	cut -d'/' -f1 |\
	rev
endef

dummy:
	@true

actual := $(shell mktemp)
reference := $(shell mktemp)
check_plugin_order: init_plugins.lua
	@$(get_plugins) >$(actual)
	@$(get_plugins) | sort >$(reference)
	@diff -su --color=always $(actual) $(reference) || true
	@rm $(actual) $(reference)

files := lua/packer_compiled.lua $\
		 $(HOME)/.local/share/nvim/site/pack/packer $\
		 $(wildcard $(HOME)/.cache/nvim/*)
clean:
	@rm -rf $(files)
