(load "singleton.lisp")
(defclass A ()
  ()
  (:metaclass Singleton-class))

(print (make-instance 'A))
