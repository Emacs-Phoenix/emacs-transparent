# -*- Makefile -*-

EMACS = emacs

# Compile with noninteractive and relatively clean environment.
BATCHFLAGS = -batch -q --no-site-file

SRCS = transparent.el

OBJS = $(SRCS:.el=.elc)

%.elc: %.el
	${EMACS} $(BATCHFLAGS) -f batch-byte-compile $^

all: $(OBJS)

clean:
	-rm -f $(OBJS)

# custom build (require loads)
transparent.elc: transparent.elc
	${EMACS} $(BATCHFLAGS) -l ./transparent.elc -f batch-byte-compile $*.el

