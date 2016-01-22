(load "../memos/memo-class.lisp")
(load "../memos/memo-object.lisp")
(load "c3-functions.lisp")


(defclass C3-metaclass (standard-class)
      ()
      (:metaclass standard-class))

(defmethod compute-class-precedence-list ((class C3-metaclass))
   (C3 class))

(defmethod validate-superclass ((class C3-metaclass) (super standard-class))
  T)

(defmethod validate-superclass ((class C3-metaclass) (super C3-metaclass))
  T)

(defmethod validate-superclass ((class standard-class) (super C3-metaclass))
  nil)

;calcule la linéarisation (ex : (computeLinearization '(Z) '((K1 A B C O) (K2 D B E O) (K3 D A O) (K1 K2 K3))) )
(defmethod computeLinearization ((cl C3-metaclass) resultList mergeList)
  (progn
    (if (check-if-empty-elements mergeList)
      resultList
      (let ((element (get-next-element mergeList)))
        (if (not element)
          (error "Linéarisation impossible : dépendance cyclique")
          (computeLinearization cl (append resultList (list element)) (remove-car-element element mergeList))
        )
      )
    )
  )
)

;retourne le merge des linéarisations des super classes avec la liste des super classes de class
(defmethod get-merge-list ((cl C3-metaclass) class)
  (let ((superclasses (class-direct-superclasses class)))
    (if (atom superclasses)
      nil
      (append
        (create-merge cl superclasses)
        (list superclasses)
      )
    )
  )
)

;calcule les linéarisations des éléments de la liste
(defmethod create-merge ((cl C3-metaclass) class-list)
  (if (atom class-list)
    nil
     (cons
      (computeLinearization cl (list (car class-list)) (get-merge-list cl (car class-list)))
      (create-merge cl (cdr class-list)))
  )
)

(defmethod C3 ((cl C3-metaclass))
  (computeLinearization cl
    (list cl)
    (get-merge-list cl cl))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;TEST;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass O (standard-object)
	()
  ;(:metaclass C3-metaclass)
)

(defclass A (O)
	()
  ;(:metaclass C3-metaclass)
)

(defclass B (O)
	()
  ;(:metaclass C3-metaclass)
)

(defclass C (O)
	()
  ;(:metaclass C3-metaclass)
)

(defclass D (O)
	()
  ;(:metaclass C3-metaclass)
)

(defclass E (O)
	()
  ;(:metaclass C3-metaclass)
)

(defclass K1 (A B C)
	()
  ;(:metaclass C3-metaclass)
)

(defclass K2 (D B E)
	()
  ;(:metaclass C3-metaclass)
)

(defclass K3 (D A)
	()
  ;(:metaclass C3-metaclass)
)

(defclass Z (K1 K2 K3)
	()
  (:metaclass C3-metaclass)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun print-list (message list)
  (print (concatenate 'string message (write-to-string list)))
)

(defmethod get-class-precedence-list ((obj standard-object))
  (map 'list 'class-name (class-precedence-list (class-of obj))))

(setq z (make-instance 'Z))
(print-list "Hiérarchie de pt : " (get-class-precedence-list z))
