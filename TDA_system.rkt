#lang racket
(require "TDA_fecha.rkt")

(require "TDA_chatbot.rkt")

;RF7
; Dominio: name (string) X chatbot* (indicando que pueden recibir 0 o más chatbots)
; Recorrido: system
; Descripcion: crea un sistema junto a su fecha de creación.
; Tipo de recursion: no se utiliza.

(define (system name . chatbot)
    (list fecha-actual name chatbot))

;RF8
; Dominio: system X chatbot
; Recorrido: system
; Descripcion: agrega un chatbot al sistema.
; Tipo de recursion: no se utiliza.

(define (system-add-chatbot system chatbot)
    (list system chatbot))
    
;creando la un nuevo sistema de chatbots con nombre “NewSystem”
(define s0 (system "NewSystem"))
;alternativamente podría usarse:
(define s1 (system "NewSystem" cb11))

;añadiendo un chatbot al sistema.
;el resultado alcanzado en s1 es equivalente al ilustrado en s1 de la función 7.
(define s2 (system-add-chatbot s0 cb11))


(newline)
s0
(newline)
s1
(newline)
s2
