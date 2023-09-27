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
    (list (remove-duplicates option limpiador_ID))))


;RF4
; Dominio: Flujo X opción
; Recorrido: flujo.
; Descripcion: agrega opciones a un flujo.
; Tipo de recursion: No se utiliza.

;en esta se verifica? por el add

;modifica, por lo tanto tiene que tener sets y gets, modifica opciones
(define (flow-add-option flujo opcion)
    (list opcion flujo)) 

;(define flow (lambda (ID name . option)
 ;   (append (list ID name)
  ;  (list (remove-duplicates option comparador)))))


;-----SELECTORES---- (get)

(define (getIDFlow flow)
    (car flow))

(define (getNameFlow flow)
    (car(cdr flow))) ;2da posición

(define (getOptionFlow flow)
    cdr(cdr(cdr flow))) ;para pasar a la función de comparador como las otras opciones que tiene el flow, junto a la "id inicial", #t si se repite #f si no

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
; Dominio: ID (int) X Opciones (list).
; Recorrido: Una lista de true o false.
; Descripcion: Retorna True si la ID se encuentra en la lista de opciones y False si no.
; Tipo de recursion: No se utiliza.




;como le paso el get id y el get options? con map? necesito un filter? uso el check?

;(define (comparador ID listaOpciones);elemento es una lista de opciones en este caso
;    (map ((lambda(ID)(lambda(elemento)
 ;   (if (= ID (getIDOption elemento))
  ;      #t
   ;     #f)
    ;    ))ID)listaOpciones))

(define (limpiador_ID lista agregados)
   (equal? (car lista) (car agregados)))


;----MODIFICADORES--- (set)

(define (set-option old-flow . opcion)
    (flow   (getIDFlow old-flow)
            (getNameFlow old-flow)
            opcion))


;---SCRIPT DE PRUEBAS----



(define op1 (option  1 "1. Viajar" 2 1 "viajar" "turistear" "conocer"))

(define op2 (option  2 "2. Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))

(define f9 (flow 1 "flujo1" op1 op2)) 





;(define l5 (comparador))

(newline)
(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2

;(define f11 (caddr f10))

f10
(newline)
;op1
(newline)
;op2
(newline)
;f10
