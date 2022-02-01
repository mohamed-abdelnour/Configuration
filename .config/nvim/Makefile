.PHONY: clean dummy

dummy:
	@true

files := lua/packer_compiled.lua $\
		 $(HOME)/.local/share/nvim/site/pack/packer $\
		 $(wildcard $(HOME)/.cache/nvim/*)
clean:
	@rm -rf $(files)
