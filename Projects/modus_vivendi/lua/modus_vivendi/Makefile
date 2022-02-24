.PHONY: check_dups dummy generate

dummy:
	@true

check_dups:
	@rg -o '\{.+\}' init.lua | sort | uniq -d

generate:
	@./generate_palette
