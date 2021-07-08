(setq resp-nil 'nil)
(setq resp-t 't)


(defun palindromep(alist)


	;(setq alist-first (first alist))
	;(setq alist-reverse-first (first(reverse alist)))
	;(setq alist-rest (rest alist))
	;(setq alist-reverse-rest (rest (reverse alist)))

	(setq first-eq-last (equal (first alist) (first(reverse alist))))

	(setq rest-is-null 'nil)
	(if (null (rest alist))
		(setq rest-is-null 't)
	)
	(if (equal (rest alist) (last alist))
		(setq rest-is-null 't)
	)

	
	;(format t "list: ~s~%first-eq-last: ~s, rest-is-null: ~s~%~%" (list alist) first-eq-last rest-is-null)
	;(write first-eq-last)
	;(terpri)
	;(format t "rest-is-null: ")
	;(write rest-is-null)
	;(terpri)

	(cond
	((null alist) resp-nil)
	((not first-eq-last) resp-nil)
	((and (equal first-eq-last 't) (equal rest-is-null 't) 't) resp-t)
	;((and (not rest-is-null) first-eq-last 't) (palindromep (reverse(rest(reverse(rest alist)))) ))
	;( ()(and (first alist) (first(reverse alist)) ) resp-t)
	;((equal(first alist) (first(reverse alist))) resp-t)
	(t (palindromep (reverse(rest(reverse(rest alist))))))
	)
)


(defun check-pal(in-list)
	;(format t "------------CHECK-------------~%")
	(setq result (palindromep in-list))
	;(format t "------------CHECK END-------------~%")
	(format t "~%List: ~s~%Result: ~s~%~%" (list in-list) result)
)



(defun run()
	(setq list-a '(a b b a))
	(setq list-b '(a b c b a))
	(setq list-c '(a b c))
	(setq list-d '(a (d e) b (d e) a))
	(setq list-e '(a (d e) b (e d) a))
	(check-pal list-a)
	(check-pal list-b)
	(check-pal list-c)
	(check-pal list-d)
	(check-pal list-e)
)
(run)

;(write (palindromep '(a b b a)))
;(terpri)
;(write (palindromep '(a b c b a)))



