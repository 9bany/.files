
;; If you are distributing this theme, please replace this comment
;; with the appropriate license attributing the original VS Code
;; theme author.

(deftheme tokyo-city "A nice dark theme.")


(let (
(color0 "#1d252c")
(color1 "#d8e2ec")
(color2 "#313940")
(color3 "#5ec4ff")
(color4 "#28323a")
(color5 "#cbd9e7")
(color6 "#454d54")
(color7 "#dfedfb")
(color8 "#ffffff")
(color9 "#0d0f17")
(color10 "#687077")
(color11 "#0DB9D7")
(color12 "#526270")
(color13 "#FF9E64")
(color14 "#7AA2F7")
(color15 "#BB9AF7")
(color16 "#9ECE6A")
(color17 "#C0F0F5")
(color18 "#41505e")
(color19 "#2c343b")
(color20 "#e7f1fb")
(color21 "#283037")
(color22 "#e3edf7"))


(custom-theme-set-faces
'tokyo-city


;; BASIC FACES
`(default ((t (:background ,color0 :foreground ,color1 ))))
`(hl-line ((t (:background ,color2 ))))
`(cursor ((t (:foreground ,color3 ))))
`(region ((t (:background ,color4 ))))
`(secondary-selection ((t (:background ,color0 ))))
`(fringe ((t (:background ,color0 ))))
`(mode-line-inactive ((t (:background ,color2 :foreground ,color5 ))))
`(mode-line ((t (:background ,color6 :foreground ,color7 ))))
`(minibuffer-prompt ((t (:background ,color0 :foreground ,color8 ))))
`(border ((t (:background ,color9 :foreground ,color9 ))))
`(vertical-border ((t (:foreground ,color10 ))))


;; FONT LOCK FACES
`(font-lock-builtin-face ((t (:foreground ,color11 ))))
`(font-lock-comment-face ((t (:foreground ,color12 ))))
`(font-lock-constant-face ((t (:foreground ,color13 ))))
`(font-lock-function-name-face ((t (:foreground ,color14 ))))
`(font-lock-keyword-face ((t (:foreground ,color15 ))))
`(font-lock-string-face ((t (:foreground ,color16 :fontStyle :bold nil :italic nil :underline nil ))))
`(font-lock-variable-name-face ((t (:foreground ,color17 ))))


;; linum-mode
`(linum ((t (:foreground ,color18 ))))
`(linum-relative-current-face ((t (:foreground ,color18 ))))


;; display-line-number-mode
`(line-number ((t (:foreground ,color18 ))))
`(line-number-current-line ((t (:foreground ,color18 ))))


;; THIRD PARTY PACKAGE FACES


;; doom-modeline-mode
`(doom-modeline-bar ((t (:background ,color6 :foreground ,color7 ))))
`(doom-modeline-inactive-bar ((t (:background ,color2 :foreground ,color5 ))))


;; web-mode
`(web-mode-string-face ((t (:foreground ,color16 ))))
`(web-mode-html-tag-face ((t (:foreground ,color15 ))))
`(web-mode-html-tag-bracket-face ((t (:foreground ,color15 ))))


;; company-mode
`(company-tooltip ((t (:background ,color19 :foreground ,color20 ))))


;; org-mode
`(org-block ((t (:background ,color21 :foreground ,color22 ))))
`(org-block-begin-line ((t (:foreground ,color12 ))))))


(custom-theme-set-variables
  'tokyo-city
  '(linum-format " %3i "))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;;###autoload
(defun tokyo-city-theme()
  "Apply the tokyo-city-theme."
  (interactive)
  (load-theme 'tokyo-city t))


(provide-theme 'tokyo-city)


;; Local Variables:
;; no-byte-compile: t
;; End:


;; Generated using https://github.com/nice/themeforge
;; Feel free to remove the above URL and this line.
