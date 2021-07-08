#|
(write 5) ;; Everything is considered a function, so this is an error if commented
(terpri)
(write '5) ;; this fixes it
(terpri)

(write '(+ 2 3 6 ))
(terpri)

(write (+ 2 3 6))
(terpri)

(write (1 2 3 ( 4 5 6) 7 8))
(terpri)

(write nil)  ;; NULL
(terpri) 

(write t)   ;;logical true, used a lot
(terpri)
|#



(setq x '(10        8))
(setq y 34.567)
(setq ch nil)
(setq n 123.78)
(setq r 124/2)

(print x)
(print y)
(print n)
(print ch)
(print r)


(print (type-of x))
(print (type-of y))
(print (type-of n))
(print (type-of ch))
(print (type-of r))


