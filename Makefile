prefix ?= /usr/local
exec_prefix ?= $(prefix)

bindir ?= $(exec_prefix)/bin
sbindir ?= $(exec_prefix)/sbin
libexecdir ?= $(exec_prefix)/libexec

datarootdir ?= $(prefix)/share
datadir ?= $(datarootdir)
sysconfdir ?= $(prefix)/etc
sharedstatedir ?= $(prefix)/com
localstatedir ?= $(prefix)/var
runstatedir ?= $(localstatedir)/run

includedir ?= /usr/local/include
oldincludedir ?= /usr/include
docdir ?= $(datarootdir)/doc/yourpkg.
infodir ?= /usr/local/share/info
htmldir?= $(docdir)
dvidir ?= $(docdir)
pdfdir ?= $(docdir)
psdir ?= $(docdir)
libdir ?= $(exec_prefix)/lib
lispdir ?= $(datarootdir)/emacs/site-lisp.

mandir ?= $(datarootdir)/man.
man1dir ?= $(mandir)/man1
man2dir ?= $(mandir)/man2
man3dir ?= $(mandir)/man3
man4dir ?= $(mandir)/man4
man5dir ?= $(mandir)/man5
man6dir ?= $(mandir)/man6
man7dir ?= $(mandir)/man7
man8dir ?= $(mandir)/man8

manext ?= .1
man1ext ?= .1
man2ext ?= .2
man3ext ?= .3
man4ext ?= .4
man5ext ?= .5
man6ext ?= .6
man7ext ?= .7
man8ext ?= .8

srcdir ?= $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

completion_top_dir ?= /usr/share/bash-completion
completion_dir ?= $(completion_top_dir)/completions
state_dir ?= /var/lib

INSTALL ?= install
INSTALL_PROGRAM ?= $(INSTALL)
INSTALL_DATA ?= ${INSTALL} -m 644

MKDIR_P ?= mkdir -p

all: puckman

print-%: ; @echo $*=$($*)

install:
	$(INSTALL_PROGRAM) puckman $(DESTDIR)$(bindir)/puckman
	$(MKDIR_P) $(DESTDIR)$(state_dir)/puckman/
	$(MKDIR_P) $(DESTDIR)$(completion_dir)
	$(INSTALL_DATA) puckman_completion $(DESTDIR)$(completion_dir)/puckman

uninstall:
	-rm -f $(DESTDIR)$(bindir)/puckman
	-rm -Rf $(DESTDIR)$(state_dir)/puckman/
	-rm -f $(DESTDIR)$(completion_dir)/puckman
	-rmdir --ignore-fail-on-non-empty $(DESTDIR)$(completion_dir)
	-rmdir --ignore-fail-on-non-empty $(DESTDIR)$(completion_top_dir)