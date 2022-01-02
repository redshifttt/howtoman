PREFIX = /usr
MANDIR = $(PREFIX)/share/man

all:
	@echo Run \'sudo make install\' to install howtoman.

install:
	@mkdir -p $(DESTDIR)$(MANDIR)/man1
	@cp -p howtoman.1 $(DESTDIR)$(MANDIR)/man1

uninstall:
	@rm -rf $(DESTDIR)$(MANDIR)/man1/howtoman.1*
