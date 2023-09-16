#lang racket
(require "TDA_flujo.rkt")





;RF5
; Dominio: name (String) X welcomeMessage (String)  X  flows* (indicando que puede recibir 0 o más flujos).
; Recorrido: Chatbot.
; Descripcion: crea un chatbot.
; Tipo de recursion: No se utiliza.


(define (chatbot name welcomeMessage . flows)
    (list name welcomeMessage flows))


;RF6 incompleta
; Dominio: chatbot X flow
; Recorrido: Chatbot.
; Descripcion: añade flujos a un chatbot.
; Tipo de recursion: De cola o natural (cambiarlo cuando la termine)

;añade flujos al final de la lista de flujos
(define (chatbot-add-flow chatbot flow)
    (if (null? chatbot) (list chatbot flow)
    (chatbot-add-flow (list chatbot flow)))
    




;creando un nuevo chatbot
(define cb10 (chatbot "Asistente" "Bienvenido \n ¿Qué te gustaría hacer?"))

;añadiendo flujo a un chatbot
;el resultado alcanzado en cb11 es equivalente al ilustrado en cb11 de la función 5.
(define cb11 (chatbot-add-flow cb10 f12))
;alternativamente podría usarse:
;(define cb11 (chatbot "Asistente" "Bienvenido \n ¿Qué te gustaría hacer?" f12)) ;no reconoce el salto de línea, pero es problema del ejemplo del profe


cb11

(provide cb11)

