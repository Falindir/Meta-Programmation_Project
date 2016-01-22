(load "memo-class.lisp")
(load "memo-object.lisp")

(defclass A (memo-object)
  (())
  (:metaclass memo-class)
)

(defclass B (memo-object)
  (())
  (:metaclass memo-class)
)

(defclass C (A B)
  (())
  (:metaclass memo-class)
)

(print "b1")
(setf b1 (make-instance 'B))
(print b1)

(print "b2")
(setf b2 (make-instance 'B))
(print b2)

(print "a")
(setq a (make-instance 'A))
(print a)

(print "c")
(setq c (make-instance 'C))
(print c)


(print "instances B")
(print (get-instance 'B))

(print "instances A")
(print (get-instance 'A))

(print "instances C")
(print (get-instance 'C))


(print "Free b2")
(delete-object b2)
(print (get-instance 'B))

(print "free c")
(delete-object c)
(print (get-instance 'C))
