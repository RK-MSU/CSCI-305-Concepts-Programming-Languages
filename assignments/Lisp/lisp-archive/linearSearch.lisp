(defun find4(alist)
	(cond
	((null alist) 0)
	((equal(first alist) 4) 1)
	((find4(rest alist)))
	)
)

(write (find4 '(6 7 2 9)) )
(terpri)