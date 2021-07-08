(setq resp-nil 'nil)
(setq resp-t 't)
(setq invalid-input "~%~%INVALID INPUT~%~%")
(setq line-sep '--------------------------------------------------)	
(setq pal "PALINDROMEP")


(defun palindromep(alist)

	(setq first-eq-last (equal (first alist) (first(reverse alist))))

	(setq rest-is-null 'nil)
	(if (null (rest alist))
		(setq rest-is-null 't)
	)
	(if (equal (rest alist) (last alist))
		(setq rest-is-null 't)
	)

	(cond

	((null alist) resp-nil)
	((not first-eq-last) resp-nil)
	((and (equal first-eq-last 't) (equal rest-is-null 't) 't) resp-t)
	(t (palindromep (reverse(rest(reverse(rest alist))))))
	)
)


(defun process-input(input)
	(setq a-list (first (last (first (last input)))))
	(setq z (first input))
	(setq fx (string z))

	(setq pal-output (palindromep a-list))
	(format t "Result:      ~s~%" pal-output)
	(main 0)
)

(defun invalid-input(input)
	(format t "INVALID INPUT: ~s~%" input)
	(main 0)
)

(defun main(show-header)
	
	(if (equal show-header '1) 
		(format t "~%~s~%Palindrome Lisp Homework (Enter 'q' to quit)~%~s~%Input Format: (palindromep '<list>)~%Example:      (palindromep '(a b b a))~%" line-sep line-sep)
	)
	
	(format t "~%Enter Input: ")
	(setq read (read))

	(cond
		((equal (type-of read) 'CONS) (process-input read))
		;( (equal pal fx) (palindromep a-list))
		( (equal read 'Q) (format t "~%~s~%QUIT~%~s~%" line-sep line-sep))
		(t (invalid-input read))
	)
)

(main 1)
