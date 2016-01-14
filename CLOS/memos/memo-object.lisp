(defclass memo-object (standard-object)
  ()
  (:metaclass memo-class))

(defmethod delete-object ((class memo-object))
 (delete-instance (class-of class) class)
)
