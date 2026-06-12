APP      := sleepr

CC       ?= gcc

PREFIX   ?= /usr/local
BINDIR   := $(PREFIX)/bin

CFLAGS   := -O2 -Wall -Wextra -Wpedantic -std=c17
LDFLAGS  :=

SRC      := $(wildcard src/*.c)
OBJ      := $(SRC:.c=.o)
DEP      := $(OBJ:.o=.d)

.PHONY: all install uninstall clean

all: $(APP)

$(APP): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)

src/%.o: src/%.c
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

install: $(APP)
	install -Dm755 $(APP) \
		$(DESTDIR)$(BINDIR)/$(APP)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(APP)

clean:
	rm -f $(APP) $(OBJ) $(DEP)

-include $(DEP)
