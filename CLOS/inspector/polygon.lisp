(load "../memos/memo-class.lisp")
(load "../memos/memo-object.lisp")


;;;; Polygone

(defclass Polygone (memo-object)
	((side-nb :accessor poly-side-nb
			:initarg :nb))
	(:metaclass memo-class)
)

(defmethod whoamI ((p Polygone))
	(print (concatenate 'string "Je suis un polygone avec " (write-to-string (poly-side-nb p)) " cotés")))


;;;; Quadrilatère

(defclass Quadrilatere (Polygone)
	((side-nb :allocation :class 
			  :initform 4)
	(side-size :accessor get-size
				:initarg :size))
	(:metaclass memo-class)
)

(defmethod initialize-instance ((q Quadrilatere) &rest initargs)  
	(call-next-method)
	(when (and (slot-boundp q 'side-nb) (not (= (poly-side-nb q) 4)))
		(error "Un quadrilatère ne peut pas avoir ~s cotés" (poly-nb q))))

(defmethod whoamI :after ((q Quadrilatere))
	(print (concatenate 'string "Je suis un quadrilatere avec " (write-to-string (poly-side-nb q)) " cotés")))

