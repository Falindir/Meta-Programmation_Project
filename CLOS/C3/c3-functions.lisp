;retourne true si l'élément est présent dans un des cdr des listes de lists, dalse sinon
(defun exist-in-cdr (element lists)
  (if (atom lists)
    nil
    (if (member element (cdar lists))
      t
      (exist-in-cdr element (cdr lists))
    )
  )
)

;supprime l'élément des listes de lists s'il est le car.
(defun remove-car-element (element lists)
  (if (atom lists)
    nil
    (if (equal element (caar lists))
      (cons (cdar lists) (remove-car-element element (cdr lists)))
      (cons (car lists) (remove-car-element element (cdr lists)))
    )
  )
)

;regarde si la liste lists est consituées d'éléments nil uniquement
(defun check-if-empty-elements (lists)
  (if (atom lists)
    t
    (and (atom (car lists)) (check-if-empty-elements (cdr lists)))
  )
)

;récupère le prochain élément (car d'une liste) qui n'apparait pas dans le cdr des autres listes.
(defun get-next-element (lists)
  (if (atom lists)
    nil
    (if (not (exist-in-cdr (caar lists) (cdr lists)))
      (caar lists)
      (get-next-element (cdr lists))
    )
  )
)