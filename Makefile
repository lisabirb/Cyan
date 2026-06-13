.PHONY: all clean

all: stuff/cyan.bin

stuff/minified.lua: cyan.lua
	npx luamin -c "$$(cat $<)" 2>/dev/null > $@

stuff/cyan.bin: stuff/minified.lua stuff/compress.lua
	cd stuff && lua compress.lua

clean:
	rm -f stuff/minified.lua stuff/cyan.bin
