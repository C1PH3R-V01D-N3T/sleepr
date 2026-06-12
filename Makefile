# Nome do comando
APP_NAME := meu-comando

# Diretórios
PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin

.PHONY: all install uninstall clean

all:
	@echo "Nada para compilar."

install:
	@echo "Instalando $(APP_NAME)..."
	install -Dm755 src/$(APP_NAME) $(DESTDIR)$(BINDIR)/$(APP_NAME)

uninstall:
	@echo "Removendo $(APP_NAME)..."
	rm -f $(DESTDIR)$(BINDIR)/$(APP_NAME)

clean:
	@echo "Nada para limpar."
