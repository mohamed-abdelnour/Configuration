.PHONY: dummy link

dummy:
	@true

ignore := --ignore-file='.gitignore'
link:
	@fd $(ignore) -t x -x ln -frs '{}' '$(HOME)/.local/bin/{/}'
