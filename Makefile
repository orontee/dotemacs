tangle_cmd = \
"(with-temp-buffer \
  (find-file \"$<\") \
  (org-babel-tangle nil nil \"emacs-lisp\\\\|sh\"))"

export_cmd = \
"(with-temp-buffer \
  (find-file \"$<\") \
  (org-html-export-as-html))"

build_files = init.el init_bash.sh

EMACSCLIENT ?= emacsclient

all: init.el init_bash.sh

html: emacs.html

init.el init_bash.sh: README.org
	$(EMACSCLIENT) -e $(tangle_cmd)

emacs.html: README.org
	$(EMACSCLIENT) -e $(export_cmd)

install: $(build_files)
	for FILE in $(build_files); do \
		mv $$FILE $(HOME)/.config/emacs/; \
	done

distclean:
	for FILE in $(build_files) emacs.html; do \
		rm --force $$FILE; \
	done

help:
	@echo "Build targets:"
	@echo "  all         - Build Emacs configuration files"
	@echo "  install     - Copy Emacs configuration files to config directory"
	@echo "  html        - Export to html"
	@echo ""
	@echo "Cleaning targets:"
	@echo "  distclean   - Delete temporary files"
