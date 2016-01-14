(defgeneric inspect-slot (i obj attr))

; Affiche le nom de la classe et inspecte chacun de ses attributs
(defgeneric inspect-instance (i cl obj))

; Inspecte son argument en appelant inspect-instance avec la classe et l'instance
(defgeneric inspect-object (i obj))


; Classe inspector

(defclass inspector (standard-object)
	())

(defmethod inspect-slot ((i inspector) obj attr)
	(let ((slot-name (slot-definition-name attr)))
		(print slot-name)
		(print (if (slot-boundp obj slot-name)
				(slot-value obj slot-name)
				"Undefined slot"))))

(defmethod inspect-instance ((i inspector) cl obj)
	(progn
		(print (class-name cl))
		 (loop for slot in (class-slots cl)
      		do (inspect-slot i obj slot))))

(defmethod inspect-object ((i inspector) obj)
	(inspect-instance i (class-of obj) obj))

