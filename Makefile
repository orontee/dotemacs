tangle_cmd = \
"(with-temp-buffer \
  (find-file \"$<\") \
  (org-babel-tangle nil nil \"emacs-lisp\"))"

export_cmd = \
"(with-temp-buffer \
  (find-file \"$<\") \
  (org-export-as-html 3))"

build_files = .emacs emacs.html

all: .emacs

html: emacs.html

.emacs: emacs.org
	emacsclient -e $(tangle_cmd)

emacs.html: emacs.org
	emacsclient -e $(export_cmd)

install: .emacs
	mv $^ $(HOME)

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
