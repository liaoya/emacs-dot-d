(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
;;  (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
;;			   ("melpa-stable" . "http://stable.melpa.org/packages/"))))
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      color-theme-sanityinc-solarized
		      ;; solarized-theme
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

;; Set Frame Maximized
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; Highlight the current line
(global-hl-line-mode 1)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor-type (quote bar))
 '(delete-selection-mode 1)
 '(global-company-mode 1)
 '(global-linum-mode 1)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages (quote (company)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 100 :width normal)))))
