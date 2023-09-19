#lang racket

;nuevo comienzo

;RF1 SON LOS NO FUNCIONALES

;RF2
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X FlowCodeLink (Int) X Keyword* (en referencia a 0 o más palabras claves).
; Recorrido: una opción.
; Descripcion: opciones de un chatbot que se puede vincular a otros.
; Tipo de recursion: No se utiliza.


;hay que verificar unicidad del código

(define (option codigo mensaje ChatBotCodeLink FlowCodeLink . Keyword)
    (append(list codigo mensaje ChatBotCodeLink FlowCodeLink Keyword))) 



;RF3
; Dominio: ID (int) nombre (String)  X Opcion*  (Indica que puede recibir cero o más opciones).
; Recorrido: un flujo.  
; Descripcion: construye un flujo.
; Tipo de recursion: No se utiliza

;Construye un flujo
(define (flow ID name . option)
   (append(list ID name (list option)))) ;o lo dejo como antes? ya que realmente no me une ambas listas, y con esta forma me agrega aún más parentesis

;-----SELECTORES---- (get)

(define (getIDFlow flow)
    (car flow))

(define (getNameFlow flow)
    (car(cdr flow))) ;2da posición

(define (getOptionFlow flow)
    cdr(cdr(cdr flow)))

;-----SELECTORES---- (get)

(define (getIDOption flow)
   (caar (caddr flow))) ;pero esto solo me hace sacar la id de la primera opción, que hago si hay más opciones???


;----MODIFICADORES--- (set)

(define (set-option old-flow . opcion)
    (flow   (getIDFlow old-flow)
            (getNameFlow old-flow)
            opcion))


;---PERTENENCIA--- (realmente verifica que no se repitan las opciones al agregarlas a un flow)

(define (check-option-exists flow option)
    (if (null? (filter (lambda (x) (
        if (equal? (getIDOption x) (getIDOption option))
            #t
            #f
       )) (getIDFlow flow)))
    #f
    #t
    ))







;----PRUEBAS----

(define prueba (flow 1 "hmmm" "1)viajar" "entretenerse"))

;prueba


(define prueba2 (getNameFlow prueba))

;prueba2

(define prueba3 (getOptionFlow prueba))

prueba3
;(define prueba4 (set-option prueba "2)estudiar" "no vacacionar" "descansos de 5 min"))

;(newline)
;prueba3
;(newline)
;prueba4

;(newline)

;---SCRIPT DE PRUEBAS----

(define op1 (option  1 "1. Viajar" 2 1 "viajar" "turistear" "conocer"))

(define op2 (option  2 "2. Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))

(define f9 (flow 1 "flujo1" op1 op2)) 

(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2

f9

;op1
(newline)
;op2
(newline)
;f10
