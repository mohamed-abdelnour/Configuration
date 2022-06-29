.PHONY: clean dummy

dummy:
	@true

files := lua/packer_compiled.lua

dirs = $(XDG_CACHE_HOME)/nvim $\
	$(XDG_DATA_HOME)/nvim $\
	$(XDG_STATE_HOME)/nvim

clean:
	@rm -rf $(files) $(dirs)
	@mkdir $(dirs)
