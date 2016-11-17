#lang racket


;; Arquivo para definição dos tipos de dados do programa.


(require 2htdp/image)
;inclua outros pacotes ou arquivos necessários usando (require ...)
(require "constantes.rkt")
(provide (all-defined-out)) ;permite que outros arquivos importem deste


;; =================
;; Definições de dados:
;; atirador é (make-atirador Natural Natural)
;; interp. representa o atirador que está numa posição x
;; da tela e anda a uma velocidade dx 

(define-struct atirador(x dx))
(define atirador1(make-atirador 300 10))
(define atirador2(make-atirador 200 5))
#;
(define (fn-para-atirador a)
  (... (atirador-x a) (atirador-dx a))
  )

;; Tiro é (make-tiro Natural Inteiro Natural)
;; interp. um tiro que apenas na vertical
(define-struct tiro(y dy x))
(define tiro1(make-tiro 350 05 100))
(define tiro2(make-tiro 300 05 50))
(define tiro3(make-tiro 200 05 150))
#;
(define (fn-para-tiro t)
  (... (tiro-y t) (tiro-dy t) (tiro-x t))
  )

;;Jogo é (make-jogo Atirador Tiro)
;; interp. representa um jogo que tem um atirador e um tiro
(define-struct jogo (atirador tiro))
(define jogo1 (make-jogo atirador1 tiro1))
(define jogo2 (make-jogo atirador2 tiro2))
(define jogo3 (make-jogo atirador1 tiro3))
#;
(define (fn-para-jogo j)
  (... (jogo-atirador j) (jogo-tiro j))
  )