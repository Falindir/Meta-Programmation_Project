(defclass memo-class (standard-class)
  ((instance-set :accessor class-instance-set
                 :initform ()))
    (:metaclass standard-class))

(defmethod make-instance ((cl memo-class) &key &allow-other-keys)
  (let ((o (call-next-method)))
        (setf (class-instance-set cl)
               (cons o (class-instance-set cl)))
               o))

(defmethod validate-superclass ((class memo-class) (super standard-class))
  (eq 'memo-object (class-name class)))

(defmethod validate-superclass ((class memo-class) (super memo-class))
  T)

(defmethod validate-superclass ((class standard-class) (super memo-class))
  nil)

(defun get-instance ((cl memo-class) &key &allow-other-keys)
   (class-instance-set (find-class cl)))

(defmethod delete-instance ((class memo-class) instance)
  (setf (class-instance-set class)
      (delete instance (class-instance-set class))
  )
)
