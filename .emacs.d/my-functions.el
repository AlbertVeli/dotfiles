;;; package --- My functions

;;; Commentary:
;;  My local Lisp functions

;;; Code:

;; Mark whole buffer and delete trailing whitespace
(defun cleanup-buffer-whitespace ()
  "Delete trailing whitespace in current buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (delete-trailing-whitespace)))

(bind-key "C-c d" 'cleanup-buffer-whitespace)

(defun reverse-characters (beg end)
 "Reverse characters between BEG and END."
 (interactive "r")
 (let ((region (buffer-substring beg end)))
   (delete-region beg end)
   (insert (nreverse region))))

;;; my-functions.el ends here
