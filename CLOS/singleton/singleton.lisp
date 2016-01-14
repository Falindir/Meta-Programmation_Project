(defclass Singleton-class (standard-class)
  ((instance :accessor get-instance
             :initform nil)))

(defmethod make-instance ((cl Singleton-class) &key &allow-other-keys)
  (or (get-instance cl)
      (setf (get-instance cl)
            (call-next-method))))
