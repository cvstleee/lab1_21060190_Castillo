#lang racket
(require "TDA_fecha.rkt")

(require "TDA_chatbot.rkt")

;RF7
; Dominio: name (string) X chatbot* (indicando que pueden recibir 0 o más chatbots)
; Recorrido: system
; Descripcion: crea un sistema junto a su fecha de creación.
; Tipo de recursion: no se utiliza.

(define (system name InitialChatbotCodeLink . chatbot)
    (list fecha-actual name InitialChatbotCodeLink chatbot))

;RF8
; Dominio: system X chatbot
; Recorrido: system
; Descripcion: agrega un chatbot al sistema.
; Tipo de recursion: no se utiliza.

;Debe verificar que el chatbot no exista en el sistema a partir del id de éste.

(define (system-add-chatbot sistema chatbot)
    (list sistema chatbot))

;RF9
; Dominio: system X user (string)
; Recorrido: system
; Descripcion: agrega un chatbot al sistema.
; Tipo de recursion: no se utiliza.

;Debe verificar que el usuario no exista en el sistema a partir del id de éste, que está dado por su nombre de usuario (String).

(define (system-add-user sistema user)
    (list sistema user))

;función que selecciona el nombre del usuario, servirá para comprobar si existe o no, requerimiento de RF9
(define (get-user sistema)
    (cdr sistema))


;RF10
; Dominio: system X user (string)
; Recorrido: system
;Descripcion: Un usuario registrado inicia sesión.
; Tipo de recursion: no se utiliza.

;Solo pueden iniciar sesión usuarios registrados mediante la función register system-add-user.
;No se puede iniciar sesión si ya existe una sesión iniciada por otro usuario.


(define (system-login sistema user)
    (list sistema user))


;RF11
; Dominio: system 
; Recorrido: system
;Descripcion: Un usuario registrado cierra sesión
; Tipo de recursion: no se utiliza.

;debe eliminar a un usuario
(define (system-logout sistema)
    )


;RF12 para el 4 y algooooo, hasta aqui debo llegar si o si


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
