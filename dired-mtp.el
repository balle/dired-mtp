;;; dired-mtp.el --- Send files marked in dired via MTP to connected Android device

;; Copyright (C) 2015 Bastian Ballmann

;; Author: Bastian Ballmann <balle@codekid.net>
;; Maintainer: Bastian Ballmann <balle@codekid.net>
;; URL: https://github.com/balle/dired-mtp
;; Created: 26th August 2015
;; Version: 0.1
;; Keywords: tools, dired
;; Package-Requires: (dired)

;; This file is not currently part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program ; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:
;;; Send files marked in dired via MTP to connected Android device

;; To install this package put it somewhere in your `load-path' and add
;; (require 'dired-mtp) to your ~/.emacs file
;; Call the function dired-mtp-sendfile on marked dired files or add a
;; keybinding with

;; (define-key dired-mode-map "c" 'dired-mtp-sendfile)

;; You must have installed libmtp (or whatever package provides mtp-sendfile binary)

;;; Code:

(defun dired-mtp-sendfile (destdir &optional arg)
  "Send all marked (or next ARG) files, or the current file 
via MTP to connected device"
  (interactive "sCopy to: ")
  (let ((file-list (dired-get-marked-files nil arg)))
    (dolist (file file-list)
      (start-process "mtp-sendfile" "*MTP-SENDFILE*" "mtp-sendfile" file destdir))))

(provide 'dired-mtp)
;;; dired-mtp.el ends here
