#lang racket
(provide (all-defined-out))


;RF2
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X FlowCodeLink (Int) X Keyword* (en referencia a 0 o más palabras claves).
; Recorrido: una opción.
; Descripcion: opciones de un chatbot que se puede vincular a otros.
; Tipo de recursion: No se utiliza.

(define (option codigo mensaje ChatBotCodeLink FlowCodeLink . Keyword)
    (list codigo mensaje ChatBotCodeLink FlowCodeLink Keyword))



;RF3
; Dominio: ID (int) nombre (String)  X Opcion*  (Indica que puede recibir cero o más opciones).
; Recorrido: un flujo.  
; Descripcion: construye un flujo.
; Tipo de recursion: No se utiliza

(define (flow ID name . option)
    (append (list ID name)
    (car(list (remove-duplicates option limpiador_ID)))))

;---COMPARADOR---
; Dominio: lista opciones x lista opciones por agregar
; Recorrido: true o false
; Descripcion: Compara ID's de las opciones que se van agregando a un flow


(define (limpiador_ID lista agregados)
   (equal? (car lista) (car agregados)))


;RF4
; Dominio: Flujo X opción
; Recorrido: flujo.
; Descripcion: agrega opciones a un flujo.
; Tipo de recursion: No se utiliza.

(define (flow-add-option old-flow . option)
    (flow   (getIDFlow old-flow)
            (getNameFlow old-flow)
            (getOptionFlow old-flow)
            option))

;-----SELECTORES---- (get)

; Dom: Flow
; Rec: int
; Descripción: Retorna la ID del flow
; Recursión: No se utiliza

(define (getIDFlow flow)
    (car flow))

; Dom: Flow
; Rec: string
; Descripción: Retorna el nombre del flow
; Recursión: No se utiliza

(define (getNameFlow flow)
    (car(cdr flow))) 

; Dom: Flow
; Rec: list
; Descripción: Retorna las opciones del flow
; Recursión: No se utiliza

(define (getOptionFlow flow)
    (car(cdr(cdr(cdr flow))))) 

; Dom: Option
; Rec: int
; Descripción: Retorna la ID de la opcion
; Recursión: No se utiliza

(define (getIDOption option)
   (car option))