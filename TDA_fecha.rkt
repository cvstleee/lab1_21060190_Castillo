#lang racket

(require racket/date)

; Dominio: current-date
; Recorrido: fecha de hoy (list)
; Descripcion: Extrae la fecha actual
; Tipo de recursion: No se utiliza recursion

(define fecha-hoy1 (current-date)) ;no es una listaaa

; Dominio: La función fecha-hoy1
; Recorrido: Entrega una lista con solo año/mes/día
; Descripcion: Extrae año/mes/día
; Tipo de recursion: No se utiliza recursion
(define fecha-hoy2
  (list (date-year fecha-hoy1)
        (date-month fecha-hoy1)
        (date-day fecha-hoy1)))

; Dominio: lista con int
; Recorrido: lista con str
; Descripcion: Convierte la fecha de entero a string
; Tipo de recursion: No se utiliza recursion

(define int-str-fecha (map number->string fecha-hoy2)) 

; Dominio: lista con str
; Recorrido: str 
; Descripcion: Une el año, mes y día en un solo string
; Tipo de recursion: No se utiliza recursion

(define fecha-actual (string-append (list-ref int-str-fecha 2) "." (list-ref int-str-fecha 1) "." (list-ref int-str-fecha 0)))

(provide fecha-actual)