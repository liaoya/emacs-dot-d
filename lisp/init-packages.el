(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  ;;  (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
  ;;			   ("melpa-stable" . "http://stable.melpa.org/packages/"))))
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/"))))

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      popwin
		      ;; --- Modes ---
			  markdown-mode
			  markdown-toc
		      dockerfile-mode
		      go-mode
		      groovy-mode
		      web-mode
		      yaml-mode
		      ;; --- Themes ---
		      monokai-theme
		      color-theme-sanityinc-solarized
		      ) "Default packages")


(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))			  

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; hungry-delete package
(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; company mode
(global-company-mode t)

;; color-theme-sanityinc-solarized package
(load-theme 'sanityinc-solarized-light t)

;; popwin package
(require 'popwin)
(popwin-mode t)

;; web-mode package
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(provide 'init-packages)
