;; (scroll-bar-mode -1)

;; Set Frame Maximized
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
;; Highlight the current line
(global-hl-line-mode t)

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(global-set-key (kbd "s-/") 'hippie-expand)

(provide 'init-ui)
