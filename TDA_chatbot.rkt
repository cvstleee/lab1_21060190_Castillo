#lang racket
(require "TDA_flujo2.rkt")


;RF5
; Dominio: name (String) X welcomeMessage (String)  X  flows* (indicando que puede recibir 0 o más flujos).
; Recorrido: Chatbot.
; Descripcion: crea un chatbot.
; Tipo de recursion: No se utiliza.

;La función también verifica que los flujos añadidos no se repitan en base al id de éstos, prácticamente lo mismo que option

(define (chatbot chatbotID name welcomeMessage startFlowId . flows)
    (append (list chatbotID name welcomeMessage startFlowId)
    (car(list(remove-duplicates flows limpiador_ID)))))

(define (getIDChatbot chatbot)
    (car chatbot))

(define (getNameChatbot chatbot)
    (cadr chatbot))

(define (getWelcomeMessage chatbot)
    (caddr chatbot))

;aqui hay un error para rf6, ver que onda
(define (getStartFlowID chatbot)
    (cadddr chatbot))

(define (getFlowsChatbot chatbot)
    (cadddr(cdr chatbot)))


;RF6 incompleta
; Dominio: chatbot X flow
; Recorrido: Chatbot.
; Descripcion: añade flujos a un chatbot.
; Tipo de recursion: De cola o natural (cambiarlo cuando la termine)

;añade flujos al final de la lista de flujos
(define (chatbot-add-flow old-chatbot . flow)
    (chatbot    (getIDChatbot old-chatbot)
                (getNameChatbot old-chatbot)
                (getWelcomeMessage old-chatbot)
                (getStartFlowID old-chatbot)
                (getFlowsChatbot old-chatbot)
                flow))
    ;(if (null? flow) chatbot)
    


;creando un nuevo chatbot
(define cb10 (chatbot 0 "Asistente" "Bienvenido\n ¿Qué te gustaría hacer?" 1))
;alternativamente podría usarse:
;(define cb11  (chatbot 0 "Asistente" "Bienvenido\n¿Qué te gustaría hacer?" 1 f12))

;(define cb0 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 f10 f10 f10 f10))  ;solo añade una ocurrencia de f10

;(define prueba1 (getFlowsChatbot cb11)) 

;añadiendo flujo a un chatbot
;el resultado alcanzado en cb11 es equivalente al ilustrado en cb11 de la función 5.
(define cb11 (chatbot-add-flow cb10 f12))



(newline)
cb11
(newline)
;cb0

(newline)
;prueba1

(provide cb11)

