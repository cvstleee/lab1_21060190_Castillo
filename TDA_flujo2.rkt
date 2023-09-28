#lang racket

;RF1 SON LOS NO FUNCIONALES

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

;Construye un flujo
(define (flow ID name . option)
    (append (list ID name)
    (car(list (remove-duplicates option limpiador_ID)))))


;RF4
; Dominio: Flujo X opción
; Recorrido: flujo.
; Descripcion: agrega opciones a un flujo.
; Tipo de recursion: No se utiliza.

;en esta se verifica? por el add

;modifica, por lo tanto tiene que tener sets y gets, modifica opciones
(define (flow-add-option old-flow . option)
    (flow   (getIDFlow old-flow)
            (getNameFlow old-flow)
            (getOptionFlow old-flow)
            option))

;no me está funcionando si se duplica la op2

;-----SELECTORES---- (get)

(define (getIDFlow flow)
    (car flow))

(define (getNameFlow flow)
    (car(cdr flow))) ;2da posición

(define (getOptionFlow flow)
    (car(cdr(cdr(cdr flow))))) ;si le saco el car, el f11 funciona sin poner el op1 al final, pero el f12 no funciona

;-----SELECTORES---- (get)

(define (getIDOption option2)
   (car option2))


;creo que este es innecesario ahora
(define (check-option option1)
    (map getIDOption option1))


;hacer currificación si uso filter

;dsp para agregar al flow 
;id serian los getid y lista opciones get options

;---COMPARADOR---
; Dominio: lista opciones x lista opciones por agregar
; Recorrido: true o false
; Descripcion: Compara ID's de las opciones que se van agregando a un flow


(define (limpiador_ID lista agregados)
   (equal? (car lista) (car agregados)))


;----MODIFICADORES--- (set)

;(define (set-option old-flow . opcion)
 ;   (flow   (getIDFlow old-flow)
  ;          (getNameFlow old-flow)
   ;         opcion))


;---SCRIPT DE PRUEBAS----



(define op1 (option  1 "1. Viajar" 2 1 "viajar" "turistear" "conocer"))

(define op2 (option  2 "2. Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))

(define f9 (flow 1 "flujo1" op1 op2)) 
(newline)
(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1))
f10
(newline)
;(display (getOptionFlow f10))


(define f11 (flow-add-option f10 op1)) 
(newline)
f11 ;me da el op1 al final y no en el inicio

(define f12 (flow-add-option f11 op2))
(newline)
f12