ETC_FILES = $(shell find etc -type f)
BIN_FILES = $(shell find usr/local/libexec -type f)

install:
	cp -r etc usr "$(DESTDIR)/"
