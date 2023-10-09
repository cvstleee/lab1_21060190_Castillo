#lang racket
(require "TDAFlujo_21060190_CastilloPerez.rkt")

(provide (all-defined-out))


;RF5
; Dominio: name (String) X welcomeMessage (String)  X  flows* (indicando que puede recibir 0 o más flujos).
; Recorrido: Chatbot.
; Descripcion: crea un chatbot.
; Tipo de recursion: No se utiliza.

(define (chatbot chatbotID name welcomeMessage startFlowId . flows)
    (if (null? flows) '()
    (append (list chatbotID name welcomeMessage startFlowId)
    (car(list(remove-duplicates flows limpiador_ID))))))

; Dom: Chatbot
; Rec: int
; Descripción: Retorna la ID del chatbot
; Recursión: No se utiliza

(define (getIDChatbot chatbot)
    (car chatbot))

; Dom: Chatbot
; Rec: string
; Descripción: Retorna el nombre del chatbot
; Recursión: No se utiliza

(define (getNameChatbot chatbot)
    (cadr chatbot))

; Dom: Chatbot
; Rec: string
; Descripción: Retorna el mensaje de bienvenida del chatbot
; Recursión: No se utiliza

(define (getWelcomeMessage chatbot)
    (caddr chatbot))

; Dom: Chatbot
; Rec: int
; Descripción: Retorna el start flow ID del chatbot
; Recursión: No se utiliza

(define (getStartFlowID chatbot)
    (cadddr chatbot))

; Dom: Chatbot
; Rec: list
; Descripción: Retorna los flows del chatbot
; Recursión: No se utiliza

(define (getFlowsChatbot chatbot)
    (cadddr(cdr chatbot)))


;RF6
; Dominio: chatbot X flow
; Recorrido: Chatbot.
; Descripcion: añade flujos a un chatbot.
; Tipo de recursion: Natural 

(define (chatbot-add-flow old-chatbot flow)
    (cond 
    [(null? flow) old-chatbot]
    [else (append (chatbot (add-flow-end (getFlowsChatbot old-chatbot) flow)))])) 
    
; Dominio: chatbot X flow
; Recorrido: Chatbot.
; Descripcion: añade flujos al final de un chatbot.
; Tipo de recursion: Natural

(define (add-flow-end flow new-flow)
    (if (null? flow) 
        new-flow
        (append (list (car flow)) (add-flow-end (cdr flow) new-flow)))) 