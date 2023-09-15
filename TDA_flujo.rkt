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

(define op1 (option  1 "1) Viajar" 2 1 "viajar" "turistear" "conocer"))
(define op2 (option  2 "2) Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))

;esta opción de prueba la cree yo
;(define op3 (option 1 "1. Viajar" 2 4 "viajar" "turistear" "conocer"))

;RF3
; Dominio: ID (int) nombre (String)  X Opcion*  (Indica que puede recibir cero o más opciones).
; Recorrido: un flujo.  
; Descripcion: construye un flujo.
; Tipo de recursion: No se utiliza

;Construye un flujo
(define (flow ID nombre . opcion)
     (duplicado (list opcion))
    (list ID nombre opcion)); como se puede ver, el ID es el primer valor de la lista, se puede usar car para obtenerlo

;debo verificar que las opciones no se repitan

(define (duplicado . arg)
    (if (equal? car (list arg) cadr(list arg) 
        (list (car arg) (cadr arg))
        null)))


;del script de pruebas
(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2 , este sirve para ver la pertenencia

f10

;creando un nuevo flow
;(define f10 (flow 1 "Flujo1")) ;el 1 es la ID
;alternativamente podría usarse:
(define f12 (flow 1 "Flujo1" op1 op2))


;este flujo de prueba lo cree yo, ya que op1 y op3 son =
;(define f20 (flow 1 "Flujo 1" op1 op3))




;RF4
; Dominio: Flujo X opción
; Recorrido: flujo.
; Descripcion: agrega opciones a un flujo.
; Tipo de recursion: No se utiliza.

;en esta se verifica? por el add

;modifica, por lo tanto tiene que tener sets y gets, modifica opciones
(define (flow-add-option flujo opcion)
    (list opcion flujo)) 

;añadiendo opciones 1 y 2 al flujo f10
;el resultado alcanzado en f12 es equivalente al ilustrado en f12 de la función 3.
;(define f11 (flow-add-option f10 op1)) ;'((1 "1. Viajar" 2 4 ("viajar" "turistear" "conocer")) "Flujo1" ())
;(define f12 (flow-add-option f11 op2))f11


;son del script de pruebas


;(define f11 (flow-add-option f10 op1)) ;se intenta añadir opción duplicada






(provide f12) ;exporta cierta función, se puede hacer con todas con all-defined-out.


