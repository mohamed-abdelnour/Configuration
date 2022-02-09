.PHONY: check_duplicate_requires clean dummy

dummy:
	@true

check_duplicate_requires:
	@rg -Io 'require\(.*?\)' | sort | uniq -d

files := lua/packer_compiled.lua $\
		 $(HOME)/.local/share/nvim/site/pack/packer $\
		 $(wildcard $(HOME)/.cache/nvim/*)
clean:
	@rm -rf $(files)
