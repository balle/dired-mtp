dired-mtp
=========

Send files marked in dired via MTP to connected Android device

To install this package put it somewhere in your `load-path' and add
(require 'dired-mtp) to your ~/.emacs file

Call the function dired-mtp-sendfile on marked dired files or add a
keybinding with

(define-key dired-mode-map "c" 'dired-mtp-sendfile)

You must have installed libmtp (or whatever package provides mtp-sendfile binary)
