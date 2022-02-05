.PHONY: clean dummy link

LOCAL_BIN := $(HOME)/.local/bin/

dummy:
	@true

link:
	@fd -t x -x ln -frs '{}' '$(LOCAL_BIN){/}'

clean:
	@fd -t l . '$(LOCAL_BIN)' -x dash -c '[ -e "{}" ] || rm {}'
