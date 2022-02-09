.PHONY: clean link

LOCAL_BIN := $(HOME)/.local/bin/

clean:
	@fd -u -t l . '$(LOCAL_BIN)' -x dash -c '[ -e "{}" ] || rm {}'

link: clean
	@fd -t x -x ln -srf '{}' '$(LOCAL_BIN){/}'
