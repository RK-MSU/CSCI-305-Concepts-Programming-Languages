
(defun name-field(record)
      (nth 0 record))

(defun number-field(record)
	(nth 2 record))

(write(name-field '((Ada Lovelace) 45000.00 38513)))
(terpri)
(write(number-field '((Hunter Lloyd) 45000.00 23456)))


