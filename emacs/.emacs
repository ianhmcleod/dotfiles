(setq make-backup-files nil)

;;packageszzzz
(defvar local-packages '(evil relative-line-numbers powerline evil-leader powerline-evil ace-jump-mode move-text key-chord evil-matchit evil-surround autopair jedi epc auto-complete))
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(defun uninstalled-packages (packages)
  (delq nil
	(mapcar (lambda (p)
		  (if (package-installed-p p nil) nil p))
		packages)))

(let ((need-to-install
       (uninstalled-packages local-packages)))
  (when need-to-install
    (progn
      (package-refresh-contents)
      (dolist (p need-to-install)
	(package-install p)))))

;;packages config
(require 'ace-jump-mode)
(set ace-jump-mode-scope 'window)
(require 'evil)
(evil-mode 1)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states 1)
(setq ace-jump-word-mode-use-query-char nil)
(evil-leader/set-key "e" 'evil-ace-jump-word-mode) 
(evil-leader/set-key "l" 'evil-ace-jump-line-mode)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) 
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-char-mode)

(defun comment-eclipse ()
      (interactive)
      (let ((start (line-beginning-position))
            (end (line-end-position)))
        (when (region-active-p)
          (setq start (save-excursion
                        (goto-char (region-beginning))
                        (beginning-of-line)
                        (point))
                end (save-excursion
                      (goto-char (region-end))
                      (end-of-line)
                      (point))))
        (comment-or-uncomment-region start end)))

(evil-leader/set-key "c" 'comment-eclipse)

(require 'powerline-evil)
(powerline-evil-vim-color-theme)
(display-time-mode t)

(require 'evil-surround)
(global-evil-surround-mode 1)

(add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
(add-hook 'prog-mode-hook 'line-number-mode t)
(require 'ido)
(ido-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(relative-line-numbers ((t (:inherit linum :background "#171717"))))
 '(relative-line-numbers-current-line ((t (:inherit relative-line-numbers :background "#171717" :foreground "yellow2")))))



;;visual stuff
(load-theme 'base16-tomorrow t)
(set-default-font "Inconsolata 16")
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-hl-line-mode 1)

(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;;allows moving lines
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(provide 'move-text)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; allows for exiting insert mode in a sane way
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(require 'autopair)
(autopair-global-mode)

;;python settings
(add-hook 'python-mode-hook 'jedi:setup)
