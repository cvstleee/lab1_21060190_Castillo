#lang racket
(require "TDAFecha_21060190_CastilloPerez.rkt")
(require "TDAFlujo_21060190_CastilloPerez.rkt")
(require "TDAChatbot_21060190_CastilloPerez.rkt")
(provide (all-defined-out))

;RF7
; Dominio: name (string) X chatbot* (indicando que pueden recibir 0 o más chatbots)
; Recorrido: system
; Descripcion: crea un sistema junto a su fecha de creación.
; Tipo de recursion: no se utiliza.

(define (system name InitialChatbotCodeLink . chatbot)
    (if (null? chatbot) (list fecha-actual name InitialChatbotCodeLink (list null))
    (append (list fecha-actual name InitialChatbotCodeLink)
    (car(list(remove-duplicates chatbot limpiador_ID))) (list null))))


;----SELECTORES---

; Dom: System
; Rec: string
; Descripción: Retorna la fecha actual del sistema
; Recursión: No se utiliza

(define (getFecha system)
  (car system))

; Dom: System
; Rec: string
; Descripción: Retorna el nombre del sistema
; Recursión: No se utiliza

(define (getNameSystem system)
  (cadr system))

; Dom: System
; Rec: int
; Descripción: Retorna el initial code link del chatbot del sistema
; Recursión: No se utiliza

(define (getInitialChatbotCodeLink system)
  (caddr system))

; Dom: System
; Rec: list
; Descripción: Retorna la lista de chatbots del sistema
; Recursión: No se utiliza

(define (getChatbot system)
  (if (null? (car(cdddr system))) '()
  (list-ref system 3)))


;RF8
; Dominio: system X chatbot
; Recorrido: system
; Descripcion: agrega un chatbot al sistema.
; Tipo de recursion: no se utiliza.


(define (system-add-chatbot old-system chatbot)
    (system (getNameSystem old-system)
            (getInitialChatbotCodeLink old-system)
            (if (null? (getChatbot old-system)) chatbot
            (append (getChatbot old-system) chatbot))))

;RF9
; Dominio: system X user (string)
; Recorrido: system
; Descripcion: agrega un usuario al sistema.
; Tipo de recursion: no se utiliza.

(define (system-add-user system user)
  (if (member user (get-user system))
      system
      (list (getFecha system)
            (getNameSystem system)
            (getInitialChatbotCodeLink system)
            (getChatbot system)
            (flatten (list (car(cddddr system)) (list user))))))



; Dominio: system 
; Recorrido: list 
; Descripcion: Obtiene los usuarios registrados en un sistema
; Tipo de recursion: no se utiliza.
(define (get-user system)
    (car (reverse system)))

;RF10
; Dominio: system X user (string)
; Recorrido: system
; Descripcion: Un usuario registrado inicia sesión.
; Tipo de recursion: no se utiliza.

(define (system-login system user)
  (if (member user (get-user system))
      (list (getFecha system)
            (getNameSystem system)
            (getInitialChatbotCodeLink system)
            (getChatbot system)
            (get-user system)
            (list "Usuario activo: " user))
            (list (getFecha system)
            (getNameSystem system)
            (getInitialChatbotCodeLink system)
            (getChatbot system)
            (get-user system)
            (list "No se pudo iniciar sesion debido a que el usuario no esta registrado"))))
              

;RF11
; Dominio: system 
; Recorrido: system
; Descripcion: Un usuario registrado cierra sesión
; Tipo de recursion: no se utiliza.

(define (system-logout system)
  (list (list (getFecha system)
              (getNameSystem system)
              (getInitialChatbotCodeLink system)
              (getChatbot system)
              (get-user system)
              null)))