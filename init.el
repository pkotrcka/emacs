;; custom variables

(custom-set-variables
 '(custom-enabled-themes '(ef-autumn))
 '(elfeed-feeds
   '("https://ag91.github.io/rss.xml" 
     "https://ilyess.cc/posts/index.xml" 
     "https://vkc.sh/feed/" 
     "https://bbbhltz.codeberg.page/rss.xml" 
     "https://hunden.linuxkompis.se/feed.xml" 
     "https://alexschroeder.ch/wiki/feed/full" 
     "https://www.fosskers.ca/en/rss" 
     "https://chinahistorypodcast.libsyn.com/rss" 
     "http://jirka.1-2-8.net/blog-rss.xml" 
     "https://mdhughes.tech/feed/" 
     "https://nullprogram.com/feed/" 
     "https://iridiumbrowser.de/feed.xml" 
     "https://rubenerd.com/feed/" 
     "https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt" 
     "https://www.dragonflydigest.com/feed" 
     "https://video.hardlimit.com/feeds/videos.xml?videoChannelId=39" 
     "https://reddit.com/r/hylang.rss" 
     "https://share.tube/feeds/videos.xml?videoChannelId=656" 
     "https://protesilaos.com/master.xml" 
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
   '(ef-themes sudo-edit vterm eww-lnum org-preview-html elpher elfeed elfeed-goodies undo-tree image-dired+))
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


;; Use a minimal cursor
(setq default-cursor-type 'hbar)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; no distractions
(toggle-scroll-bar -1)

;; start maximized

(toggle-frame-maximized)

;; parens pairs
(show-paren-mode 1)
(setq show-paren-delay 0)

;; windmove

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; undo tree

(global-undo-tree-mode)

;; pulsar

(require 'pulsar)


;; set custom face for minibuffer

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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

(global-set-key (kbd "C-x C-S-b") 'ibuffer-other-window)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "C-c se") 'sudo-edit)

;; window resize

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-c v m") 'visual-line-mode)

;; beg and end of buffer, because the default binding does not work with sk layout on every kbd
(global-set-key (kbd "C-c b b") 'beginning-of-buffer)
(global-set-key (kbd "C-c e b") 'end-of-buffer)

;; splits

(global-set-key (kbd "C-s-<right>") 'split-window-horizontally)
(global-set-key (kbd "C-s-<down>") 'split-window-vertically)

;; wrapping

(global-set-key (kbd "<f5>") 'toggle-truncate-lines)

;; macro for http

(defun httpgo ()
  (interactive)
  (search-forward "http"))

(global-set-key (kbd "C-c hh") 'httpgo)

;; macro for perl code in orgmode

(defun perlins ()
  (interactive)
  (insert "#+BEGIN_SRC perl \n\n#+END_SRC")
  (previous-line)
  (move-beginning-of-line))
