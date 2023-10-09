#lang racket
(require "TDAChatbot_21060190_CastilloPerez.rkt")
(require "TDAFlujo_21060190_CastilloPerez.rkt")
(require "TDASystem_21060190_CastilloPerez.rkt")


;--- SCRIPT PRUEBAS 1----
(define op1 (option  1 "1) Viajar" 2 1 "viajar" "turistear" "conocer"))
(define op2 (option  2 "2) Estudiar" 3 1 "estudiar" "aprender" "perfeccionarme"))
(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1)) ;solo añade una ocurrencia de op2
(define f11 (flow-add-option f10 op1)) ;se intenta añadir opción duplicada
(define cb0 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 f10 f10 f10 f10))  ;solo añade una ocurrencia de f10
(define s0 (system "Chatbots Paradigmas" 0 cb0 cb0 cb0))
(define s1 (system-add-chatbot s0 cb0)) ;igual a s0
(define s2 (system-add-user s1 "user1"))
(define s3 (system-add-user s2 "user2"))
(define s4 (system-add-user s3 "user2")) ;solo añade un ocurrencia de user2
(define s5 (system-add-user s4 "user3"))
(define s6 (system-login s5 "user8")) ;user8 no existe. No inicia sesión
(define s7 (system-login s6 "user1"))
(define s8 (system-login s7 "user2"))  ;no permite iniciar sesión a user2, pues user1 ya inició sesión
(define s9 (system-logout s8))
;(define s10 (system-login s9 "user2"))


;--SCRIPT DE PRUEBAS 2 (con cambios para que no hiciera tope con script 1)----

;Chabot0
(define op3 (option  1 "1) Viajar" 1 1 "viajar" "turistear" "conocer"))
(define op4 (option  2 "2) Estudiar" 2 1 "estudiar" "aprender" "perfeccionarme"))
(define f12 (flow 1 "Flujo Principal Chatbot 1\nBienvenido\n¿Qué te gustaría hacer?" op3 op4 op4 op4 op4 op3)) ;solo añade una ocurrencia de op2 y op1
(define f13 (flow-add-option f12 op3)) ;se intenta añadir opción duplicada            
(define cb1 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría hacer?" 1 f12 f12 f12 f12))  ;solo añade una ocurrencia de f10
;Chatbot1
(define op5 (option 1 "1) New York, USA" 1 2 "USA" "Estados Unidos" "New York"))
(define op6 (option 2 "2) París, Francia" 1 1 "Paris" "Eiffel"))
(define op7 (option 3 "3) Torres del Paine, Chile" 1 1 "Chile" "Torres" "Paine" "Torres Paine" "Torres del Paine"))
(define op8 (option 4 "4) Volver" 0 1 "Regresar" "Salir" "Volver"))
;Opciones segundo flujo Chatbot1
(define op9 (option 1 "1) Central Park" 1 2 "Central" "Park" "Central Park"))
(define op10 (option 2 "2) Museos" 1 2 "Museo"))
(define op11 (option 3 "3) Ningún otro atractivo" 1 3 "Museo"))
(define op12 (option 4 "4) Cambiar destino" 1 1 "Cambiar" "Volver" "Salir")) 
(define op13 (option 1 "1) Solo" 1 3 "Solo")) 
(define op14 (option 2 "2) En pareja" 1 3 "Pareja"))
(define op15 (option 3 "3) En familia" 1 3 "Familia"))
(define op16 (option 4 "4) Agregar más atractivos" 1 2 "Volver" "Atractivos"))
(define op17 (option 5 "5) En realidad quiero otro destino" 1 1 "Cambiar destino"))
(define f20 (flow 1 "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?" op5 op6 op6 op8))
(define f21 (flow 2 "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?" op9 op10 op11 op12))
(define f22 (flow 3 "Flujo 3 Chatbot1\n¿Vas solo o acompañado?" op13 op14 op15 op16 op17))
(define cb2 (chatbot 1 "Agencia Viajes"  "Bienvenido\n¿Dónde quieres viajar?" 1 f20 f21 f22))
;Chatbot2
(define op18 (option 1 "1) Carrera Técnica" 2 1 "Técnica"))
(define op19 (option 2 "2) Postgrado" 2 1 "Doctorado" "Magister" "Postgrado"))
(define op20 (option 3 "3) Volver" 0 1 "Volver" "Salir" "Regresar"))

(define f30 (flow 1 "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?" op18 op19 op20))
(define cb3 (chatbot 2 "Orientador Académico"  "Bienvenido\n¿Qué te gustaría estudiar?" 1 f30))
;Sistema
(define s11 (system "Chatbots Paradigmas" 0 cb1 cb1 cb1 cb2 cb3))
(define s12 (system-add-chatbot s11 cb1)) ;igual a s0
(define s13 (system-add-user s12 "user1"))
(define s14 (system-add-user s13 "user2"))
(define s15 (system-add-user s14 "user2"))
(define s16 (system-add-user s15 "user3"))
(define s17 (system-login s16 "user8"))
(define s18 (system-login s17 "user1"))
(define s19 (system-login s18 "user2"))
(define s20 (system-logout s19))
;(define s21 (system-login s20 "user2"))
;las siguientes interacciones deben funcionar de igual manera con system-talk-rec  o system-talk-norec 
;(define s11 (system-talk-rec s10 "hola"))
;(define s12 (system-talk-rec s11 "1"))
;(define s13 (system-talk-rec s12 "1"))
;(define s14 (system-talk-rec s13 "Museo"))
;(define s15 (system-talk-rec s14 "1"))
;(define s16 (system-talk-rec s15 "3"))
;(define s17 (system-talk-rec s16 "5"))
;(display (system-synthesis s17 "user2"))
;(system-simulate s0 5 32131)


;---Script creado por Aylin Castillo con tres ejemplos para cada función---

;-- ejemplos función option
(define op21 (option 10 "10) Música" 5 1 "K-POP" "R&B" "Hip-Hop"))
(define op22 (option 11 "11) Trabajo" 6 1 "Barista" "Comida rapida" "Distribuicion"))
(define op23 (option 12 "12) Locales de sushi" 7 1 "Sayonara sushi" "sushi vale" "sushis gohan"))

;---ejemplos función flow

(define f14 (flow 13 "flujo13" op21 op22))
(define f15 (flow 14 "flujo14" op21 op23))
(define f16 (flow 15 "flujo15" op21 op23 op23))

;---ejemplos función add-flow

(define f17 (flow-add-option f15 op21))
(define f18 (flow-add-option f16 op22))
(define f19 (flow-add-option f14 op12))

;ejemplos función chatbot

(define cb4 (chatbot 3 "chatbot3" "Bienvenido/a, elija la opción que quiera" 3 f14))
(define cb5 (chatbot 4 "chatbot4" "Bienvenido/a, elija la opción que quiera" f15))
(define cb6 (chatbot 5 "chatbot5" "Bienvenido/a, elija la opción que quiera" f19))

;ejemplos función add-flow, los 3 dan error

;(define cb7 (chatbot-add-flow cb3 f17))
;(define cb8 (chatbot-add-flow cb4 f16))
;(define cb9 (chatbot-add-flow cb5 f14))

;ejemplos función system

(define s100 (system "sistema 11" 11 cb4))
;(define s101 (system "sistema 12" 12 cb5 cb5))
;(define s102 (system "sistema 13" 13 cb7 cb8))

;ejemplos add-chatbot

(define s103 (system-add-chatbot s100 cb5))
;(define s104 (system-add-chatbot s101 cb9))
;(define s105 (system-add-chatbot s102 cb4))

;ejemplos add-user

(define u1 (system-add-user s100 "user10"))
(define u2 (system-add-user s100 "user1"))
;(define u3 (system-add-user s100 "user10"))

;ejemplos log in

(define u4 (system-login u1 "user10")) ;ver si funciona, pq debe funcionar
;(define u5 (system-login u2 "user10")) ;en este también deberia funcionar
;(define u6 (system-login u3 "user4")) ;no deberia logear


;ejemplos log out

(define u7 (system-logout u4))
;(define u8 (system-logout u6 "user1"));no deberia hacer nada
;(define u9 (system-logout u5 "user10"))
