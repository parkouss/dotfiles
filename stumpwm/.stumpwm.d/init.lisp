;; -*- mode: lisp -*-

(in-package :stumpwm)

(setf *mouse-focus-policy* :click)

(set-prefix-key (kbd "M-Tab"))

(load-module "kbd-layouts")
;; on my laptop, I like using capslock as a ctrl
(setq kbd-layouts:*caps-lock-behavior* :ctrl)
;; I use the bepo french layout
(kbd-layouts:keyboard-layout-list "fr bepo" "fr")

(defcommand emacs () ()
  "run emacs"
  (run-or-raise "emacsclient -c -a ''" '(:class "Emacs")))
;;(define-key *root-map* (kbd "e") "emacs")

(defcommand emacs-terminal () ()
  "run the emacs terminal"
  (emacs)
  (send-meta-key (current-screen) (kbd "C-c"))
  (window-send-string "tg"))
(define-key *root-map* (kbd "t") "emacs-terminal")

(defcommand terminal () ()
  "run urxvt"
  (run-or-raise "exec urxvtc -e tmux attach-session"
                '(:class "URxvt")))
(define-key *root-map* (kbd "T") "terminal")

(defcommand conkeror () ()
  "run conkeror"
  (run-or-raise "conkeror" '(:class "Conkeror")))
(define-key *root-map* (kbd "c") "conkeror")

(defcommand hipchat () ()
  "run hipchat"
  (run-or-raise "hipchat" '(:class "Hipchat")))
(define-key *root-map* (kbd "H") "hipchat")

(define-key *root-map* (kbd "w") "windowlist")
(define-key *root-map* (kbd "C-w") "windowlist")

(define-key *root-map* (kbd "m") "mode-line")

(defcommand search-google () ()
  "search on google"
  (conkeror)
  (send-meta-key (current-screen) (kbd "C-x"))
  (send-meta-key (current-screen) (kbd "C-f"))
  ;; I can't send two same letters one right after the other...
  (window-send-string "go")
  (send-meta-key (current-screen) (kbd "C-e"))
  (window-send-string "ogle "))
(define-key *root-map* (kbd "M-g") "search-google")

;; volume key bindings
(defcommand my-raise-volume () ()
  (run-shell-command "amixer -D pulse sset Master 5%+"))
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "my-raise-volume")

(defcommand my-lower-volume () ()
  (run-shell-command "amixer -D pulse sset Master 5%-"))
(define-key *top-map* (kbd "XF86AudioLowerVolume") "my-lower-volume")

(defcommand my-mute-volume () ()
  (run-shell-command "amixer -D pulse set Master 1+ toggle"))
(define-key *top-map* (kbd "XF86AudioMute") "my-mute-volume")

;; start a slime server, so that we can connect to it with emacs!
;; M-x slime-connect RET RET
(let ((swank-loader-files (directory "~/.emacs.d/melpa/slime-*/start-swank.lisp")))
  (if swank-loader-files
      (load (car swank-loader-files))))
