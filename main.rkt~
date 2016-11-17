
;Este arquivo é o arquivo principal de onde o programa deve ser chamado.
;A única modificação que deve ser feita neste arquivo são os nomes finais das funções chamadas
;dentro do big-bang e o nome final do EstadoMundo. As funções em si devem ser implementadas em "jogo.rkt".

#lang racket

(require 2htdp/universe)
(require "jogo.rkt")   ;importa as funções definidas em "jogo.rkt" 

;; EstadoMundo -> EstadoMundo
;; inicie o mundo com (main ...)
;; 
(define (main estado)
  (big-bang estado               ; EstadoMundo
            (on-tick   tock)     ; EstadoMundo -> EstadoMundo
            (to-draw   desenha)  ; EstadoMundo -> Image
            (stop-when terminou?)      ; EstadoMundo -> Boolean
            (on-mouse  trata-mouse)      ; EstadoMundo Integer Integer MouseEvent -> EstadoMundo
            (on-key    trata-tecla)))    ; EstadoMundo KeyEvent -> EstadoMundo