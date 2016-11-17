; Este arquivo deve conter as definições das funções do jogo (com exceção da main).
; As definições devem incluir assinatura, propósito, protótipo e templates utilizados.


#lang racket

(require 2htdp/image)
(require 2htdp/universe)
(require "constantes.rkt") ;importa as constantes definidas no arquivo "constantes.rkt"
(require "dados.rkt") ;importa as definições de dados definidas no arquivo "dados.rkt"

(provide (all-defined-out)) ;permite que outros arquivos importem deste


;; atirador -> atirador
;; produz o próximo ...
;; !!!
(define (proximo-atirador atirador) atirador)    


;; atirador -> Image 
;; desenha ... 
;; !!!
(define (desenha-atirador a)
  (place-image AVIAO (atirador-x a) Y-ATIRADOR CENARIO))


;; EstadoMundo -> Boolean
;; define se o jogo deve ser terminado quando ...
;; !!!
(define (terminou? estado) false)   ;;protótipo



;; Atirador KeyEvent -> Atirador
;; quando tecla ... é pressionada produz ...  <apagar caso não precise usar>
(define (trata-tecla-atirador a ke)
  (cond [(key=? ke "left") (make-atirador (-(atirador-x a)(atirador-dx a)) (atirador-dx a))]
        [(key=? ke "right") (make-atirador (+(atirador-x a)(atirador-dx a)) (atirador-dx a))]
        [else
         a]))     


;; EstadoMundo Integer Integer MouseEvent -> EstadoMundo
;; Quando fazer ... nas posições x y no mouse produz ...   <apagar caso não precise usar>
(define (trata-mouse estado x y me)
(cond [(mouse=? me "button-down") estado]
      [else
       estado]))    ;;protótipo


;; tiro -> tiro
;; produz o próximo ...
;; !!!
(define (proximo-tiro t)
  (make-tiro (-(tiro-y t)(tiro-dy t)) (tiro-dy t) (tiro-x t)))



;; tiro -> Image 
;; desenha ... 
;; !!!
(define (desenha-tiro t)
  (place-image IMG-TIRO (tiro-x t) (tiro-y t) CENARIO))


;; jogo -> jogo
(define (proximo-jogo j)
  (make-jogo
   (proximo-atirador (jogo-atirador j))
   (proximo-tiro (jogo-tiro j))
  ))
;; jogo -> imagem
(define (desenha-jogo j)
  (place-image IMG-TIRO (tiro-x (jogo-tiro j)) (tiro-y (jogo-tiro j))
               (desenha-atirador (jogo-atirador j))))

;; jogo-> jogo
(define (trata-tecla-jogo j ke)
  (make-jogo
   (trata-tecla-atirador (jogo-atirador j) ke)
   (jogo-tiro j))
  )


  