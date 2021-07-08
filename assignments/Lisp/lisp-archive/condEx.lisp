(defun testIf( alist )

    (cond

    ((null alist) 0)
    ((atom alist) 1)
    ((list alist) 33)
    (t 55)
   )
)

(write(testIf '()))
(terpri)
(write(testIf '(4 5)))
(terpri)
(write(testIf '4))