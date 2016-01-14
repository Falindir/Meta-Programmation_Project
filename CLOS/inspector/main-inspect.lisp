(load "polygon.lisp")
(load "inspector.lisp")


(setq p (make-instance 'Polygone :nb 5))
(setq q (make-instance 'Quadrilatere :size 5))
(setq q2 (make-instance 'Quadrilatere :size 6))

(setq i (make-instance 'inspector))

(inspect-object i p)
(inspect-object i q)
(inspect-object i q2)
