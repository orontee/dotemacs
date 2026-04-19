;;; matthem-dark-theme.el --- theme                             -*- lexical-binding: t; -*-

;; Copyright (C) 2026  DLT-LP-238

;; Author: DLT-LP-238 <matthias@DLT-LP-238>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; `modus-vivendi-tinted' with small changes to match my expectations

;;; Code:

(defvar mattheme-dark-custom-faces
  '(
    `(italic ((,c :weight bold :family "Mono")))
    `(fill-column-indicator ((,c :foreground ,bg-inactive)))
    ;; scale down line number
    `(line-number ((,c :height 0.8)))
    `(line-number-current-line ((,c :inherit line-number)))
    ;; variable pitch face in info headings
    `(info-title-4 ((,c :inherit (bold variable-pitch) :height 1.0 :foreground ,fg-heading-4)))
    `(info-title-3 ((,c :inherit info-title-4 :height 1.2 :foreground ,fg-heading-3)))
    `(info-title-2 ((,c :inherit info-title-3 :height 1.2 :foreground ,fg-heading-2)))
    `(info-title-1 ((,c :inherit info-title-2 :height 1.2 :foreground ,fg-heading-1)))
    ;; variable pitch face in markdown headings
    `(markdown-header-face-1 ((,c :inherit markdown-header-face-2 :height 1.2 :foreground ,fg-heading-1)))
    `(markdown-header-face-2 ((,c :inherit markdown-header-face-3 :height 1.2 :foreground ,fg-heading-2)))
    `(markdown-header-face-3 ((,c :inherit markdown-header-face-4 :height 1.2 :foreground ,fg-heading-3)))
    `(markdown-header-face-4 ((,c :inherit (bold variable-pitch) :height 1.0 :foreground ,fg-heading-4)))
    ;; flat tab bar
    `(tab-bar ((,c :inherit modus-themes-ui-variable-pitch :background ,bg-tab-current)))
    `(tab-bar-tab ((,c :background ,bg-tab-current :box (:line-width (4 . 4) :color ,bg-tab-current))))
    `(tab-bar-tab-inactive ((,c :foreground ,fg-mode-line-inactive :background ,bg-tab-bar :box (:line-width (4 . 4) :color ,bg-tab-bar))))
    ;; lighter fill column indicator
    `(fill-column-indicator ((,c :background ,bg-dim))))
  "Custom faces that deviate from---or complement---those in the Modus themes.")

(modus-themes-theme
 'matthem-dark
 'matthem-themes
 "The `matthem-dark' theme."
 'dark
 'modus-vivendi-tinted-palette
 nil
 nil
 'mattheme-dark-custom-faces)

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (add-to-list 'custom-theme-load-path dir)))

(provide 'matthem-dark)
;;; matthem-dark-theme.el ends here
