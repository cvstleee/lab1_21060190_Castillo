#lang racket

;RF1 SON LOS NO FUNCIONALES

;RF2
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X FlowCodeLink (Int) X Keyword* (en referencia a 0 o más palabras claves).
; Recorrido: una opción.
; Descripcion: opciones de un chatbot que se puede vincular a otros.
; Tipo de recursion: No se utiliza.

(define (option codigo mensaje ChatBotCodeLink FlowCodeLink . Keyword)
    (list codigo mensaje ChatBotCodeLink FlowCodeLink Keyword)) 

(define op1 (option  1 "1. Viajar" 2 4 "viajar" "turistear" "conocer"))

(define op2 (option  2 "2. Estudiar" 4 3 "aprender" "perfeccionarme"))

;RF3
; Dominio: nombre (String)  X Opcion*  (Indica que puede recibir cero o más opciones).
; Recorrido: un flujo.  
; Descripcion: construye un flujo.
; Tipo de recursion: No se utiliza

;Construye un flujo
(define (flow nombre . opcion)
    (list nombre opcion))

;Consigue la id el flujo

(define (getID system)
    (car system));saca el primer valor de la lista?? ver si por ahi va la cosa


(define (IDautoincremental system)
    (+ (getID system) 1)) ;tengo que hacer la función get id

;creando un nuevo flow
(define f10 (flow "Flujo1")); por ej ahi deberia ir el id el f10 igual podria ser la id...
;(define f12 (flow "Flujo1" op1 op2))

;RF4
; Dominio: Flujo X opción
; Recorrido: flujo.
; Descripcion: agrega opciones a un flujo.
; Tipo de recursion: No se utiliza.

;modifica, por lo tanto tiene que tener sets y gets, modifica opciones
(define (flow-add-option flujo opcion)
    (list opcion flujo)) 

;añadiendo opciones 1 y 2 al flujo f10
;el resultado alcanzado en f12 es equivalente al ilustrado en f12 de la función 3.
(define f11 (flow-add-option f10 op1)) ;'((1 "1. Viajar" 2 4 ("viajar" "turistear" "conocer")) "Flujo1" ())
(define f12 (flow-add-option f11 op2))
f11
f12

(provide f12) ;exporta cierta función, se puede hacer con todas con all-defined-out.


