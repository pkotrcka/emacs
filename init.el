;; custom variables
(custom-set-variables
 '(custom-enabled-themes '(wombat))
 '(elfeed-feeds
   '("https://ag91.github.io/rss.xml" 
     "https://ilyess.cc/posts/index.xml" 
     "https://vkc.sh/feed/" 
     "https://bbbhltz.codeberg.page/rss.xml" 
     "https://alexschroeder.ch/wiki/feed/full" 
     "http://jirka.1-2-8.net/blog-rss.xml" 
     "https://mdhughes.tech/feed/" 
     "https://nullprogram.com/feed/" 
     "https://iridiumbrowser.de/feed.xml" 
     "https://rubenerd.com/feed/" 
     "https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt" 
     "https://www.dragonflydigest.com/feed" 
     "https://dataswamp.org/~solene/rss.xml" 
     "http://sachachua.com/blog/feed"))
 '(erc-nick "kotrcka")
 '(erc-port 6697)
 '(erc-prompt-for-nickserv-password t)
 '(erc-server "irc.libera.chat")
 '(font-use-system-font t)
 '(menu-bar-mode nil)
 '(org-html-validation-link "" t)
 '(package-selected-packages
   '(sudo-edit eww-lnum org-preview-html elpher elfeed elfeed-goodies undo-tree image-dired+))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(delete-selection-mode t)
 '(undo-tree-visualizer-diff t)
 '(undo-tree-visualizer-relative-timestamps t))

;; melpa

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; install packages 

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)


;; UI settings
(setq default-cursor-type 'hbar) ;Use a minimal cursor
(setq initial-scratch-message "") ; Don't use messages that you don't read
(setq inhibit-startup-message t)
(setq visible-bell t) ; Don't let Emacs hurt your ears
(toggle-scroll-bar -1) ; no distractions
(toggle-frame-maximized) ; start maximized
(setq warning-minimum level :error) ;only warn on errors

;; parens pairs
(show-paren-mode 1)
(setq show-paren-delay 0)

;; windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; undo tree
(global-undo-tree-mode)

;; set custom face for minibuffer
(custom-set-faces
 '(default ((t (:family "IBM Plex Mono" :foundry "IBM " :slant normal :weight normal :height 98 :width normal))))
 '(minibuffer-prompt ((t (:foreground "dark blue" :height 220 :family "IBM Plex Mono")))))

;; eww settings
(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors nil                          ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-inhibit-images t
 eww-search-prefix "https://www.mojeek.com/search?hp=minimal&q=") ; Use Mojeek Minimal for search (default)

;; OTHER KEYBINDINGS
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-c se") 'sudo-edit)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-c v m") 'visual-line-mode)
(global-set-key (kbd "C-c b b") 'beginning-of-buffer)
(global-set-key (kbd "C-c e b") 'end-of-buffer)
(global-set-key (kbd "<f5>") 'toggle-truncate-lines)

;; function for http
(defun httpgo ()
  (interactive)
  (search-forward "http"))

(global-set-key (kbd "C-c hh") 'httpgo)
