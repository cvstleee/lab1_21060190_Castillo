#lang racket

;RF1 SON LOS NO FUNCIONALES

;RF2
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X FlowCodeLink (Int) X Keyword* (en referencia a 0 o más palabras claves).
; Recorrido: una opción.
; Descripcion: opciones de un chatbot que se puede vincular a otros.
; Tipo de recursion: No se utiliza.


;hay que verificar unicidad del código

(define (option codigo mensaje ChatBotCodeLink FlowCodeLink . Keyword)
    (list codigo mensaje ChatBotCodeLink FlowCodeLink Keyword))



;RF3
; Dominio: ID (int) nombre (String)  X Opcion*  (Indica que puede recibir cero o más opciones).
; Recorrido: un flujo.  
; Descripcion: construye un flujo.
; Tipo de recursion: No se utiliza

;Construye un flujo
(define (flow ID name . option)
   (list ID name (check-option option))) ;quitar el  option en caso de, el list dentro del check crea una lista de las IDS.

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


(define (comparador ID listaOpciones);elemento es una lista de opciones en este caso
    (map ((lambda(ID)(lambda(elemento)
    (if (= ID (getIDOption elemento))
        #t
        #f)
        ))ID)listaOpciones))



;----MODIFICADORES--- (set)

(define (set-option old-flow . opcion)
    (flow   (getIDFlow old-flow)
            (getNameFlow old-flow)
            opcion))






;----PRUEBAS----

;(define prueba (flow 1 "hmmm" "1)viajar" "entretenerse"))

;prueba


;(define prueba2 (getNameFlow prueba))

;prueba2

;(define prueba3 (getOptionFlow prueba))


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


;lo de abajo recopilarlo en una funcion
(define l1 (list op1 op1 op2))

(define l2 (comparador 1 l1)) ;'(#t #f)

(define l3 (member #t l2)) ;comprueba si existe cierto elemento dentro de la lista y devuelve ese elemento hasta el final de la lista y si no lo encuentra da un false

(define l4 (if (boolean? l3) ;si no lo encuentra, va a devolver un booleano (#f), por lo que se comprueba si el argumento es realmente un booleano, pq no encontró el elemento en la lista
    #f
    #t))
l1

l2
l3
l4

;f9

(newline)
;(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2

;f10
;op1
(newline)
;op2
(newline)
;f10
