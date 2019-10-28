tangle_cmd = \
"(with-temp-buffer \
  (find-file \"$<\") \
  (org-babel-tangle nil nil \"emacs-lisp\"))"

export_cmd = \
"(with-temp-buffer \
  (find-file \"$<\") \
  (org-html-export-as-html))"

build_files = init.el emacs.html

EMACSCLIENT ?= emacsclient

all: init.el

html: emacs.html

init.el: README.org
	$(EMACSCLIENT) -e $(tangle_cmd)

emacs.html: README.org
	$(EMACSCLIENT) -e $(export_cmd)

install: init.el
	mv $^ $(HOME)/.config/emacs/

distclean:
	for FILE in $(build_files); do \
		[ -f $$FILE ] && rm $$FILE; \
	done

help:
	@echo "Build targets:"
	@echo "  all         - Build Emacs configuration file"
	@echo "  install     - Copy Emacs configuration file to home directory"
	@echo "  html        - Export to html"
	@echo ""
	@echo "Cleaning targets:"
	@echo "  distclean   - Delete temporary files"
