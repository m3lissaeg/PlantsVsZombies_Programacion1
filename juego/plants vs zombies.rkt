;Laura Daniela Galeano Villada
;Melissa Escobar Gutierrez
;Proyecto Final de Programacion 1. UTP 2016-2.

(require(lib "graphics.ss" "graphics"))
(open-graphics)

(define inicio(open-viewport "inicio" 978 740))
((draw-pixmap inicio)"inicio.jpg" (make-posn 0 0))

;funcion del menu 
(define(menu inicio)
 (if (get-mouse-click inicio)
     (begin
          (if (and
           (>= (posn-x(query-mouse-posn inicio))210)
           (<= (posn-x(query-mouse-posn inicio))800)
           (>= (posn-y(query-mouse-posn inicio))620)
           (<=(posn-y (query-mouse-posn inicio))710)
           (play-sound "sonidoclick.wav" #t))
           (begin
             
             ((draw-pixmap inicio)"menu.jpg" (make-posn 0 0))
             (play-sound "menu.wav" #t))
           
           
          )
  
         (if (and
             (>= (posn-x(query-mouse-posn inicio))520)
             (<= (posn-x(query-mouse-posn inicio))920)
             (>= (posn-y(query-mouse-posn inicio))248)
             (<=(posn-y (query-mouse-posn inicio))318)
             (play-sound "sonidoclick.wav" #t))
             ((draw-pixmap inicio)"instrucciones.jpg" (make-posn 0 0))
               
         )

    (if (and
             (>= (posn-x(query-mouse-posn inicio))520)
             (<= (posn-x(query-mouse-posn inicio))880)
             (>= (posn-y(query-mouse-posn inicio))360)
             (<=(posn-y (query-mouse-posn inicio))410)
             (play-sound "sonidoclick.wav" #t))
               ((draw-pixmap inicio)"creditos.jpg" (make-posn 0 0))
                    
     )

    (if (and ; le da clic al botón quit
             (>= (posn-x(query-mouse-posn inicio))520)
             (<= (posn-x(query-mouse-posn inicio))840)
             (>= (posn-y(query-mouse-posn inicio))460)
             (<=(posn-y (query-mouse-posn inicio))510)
             
             (play-sound "sonidoclick.wav" #t))
             (close-viewport inicio)  
     )
    (if (and ; botón atrás  
             (>= (posn-x(query-mouse-posn inicio))20)
             (<= (posn-x(query-mouse-posn inicio))170)
             (>= (posn-y(query-mouse-posn inicio))110)
             (<=(posn-y (query-mouse-posn inicio))220)
              
             (play-sound "sonidoclick.wav" #t))
               ((draw-pixmap inicio)"menu.jpg" (make-posn 0 0))
     )

    (if (and ; al darle clic en "clic to start"
             (>= (posn-x(query-mouse-posn inicio))20)
             (<= (posn-x(query-mouse-posn inicio))170)
             (>= (posn-y(query-mouse-posn inicio))270)
             (<=(posn-y (query-mouse-posn inicio))380)
             (play-sound "sonidoclick.wav" #t))
        
             ((draw-pixmap inicio)"menu.jpg" (make-posn 0 0))
             
     )

    (if (and
             (>= (posn-x(query-mouse-posn inicio))520)
             (<= (posn-x(query-mouse-posn inicio))920)
             (>= (posn-y(query-mouse-posn inicio))115)
             (<=(posn-y (query-mouse-posn inicio))215)
             )
             (begin ; al darle clic en adventure inicia el juego 
               (play-sound "brains.wav" #t)
               (play-sound "juego.wav" #t)
               ((draw-pixmap inicio)"escenario.jpg" (make-posn 0 0))
               (((draw-pixmap-posn "empezar.png") inicio)(make-posn 700 50))
               ((draw-line inicio)(make-posn 450 105)(make-posn 450 705) "red")
               ;strings para el contador de las plantas
               ((draw-string inicio)(make-posn 157 88)(number->string(vector-ref vec 0)))
               ((draw-string inicio)(make-posn 230 88)(number->string(vector-ref vec 1)))
               ((draw-string inicio)(make-posn 303 88)(number->string(vector-ref vec 2)))
               ((draw-string inicio)(make-posn 378 88)(number->string(vector-ref vec 3)))
               ((draw-string inicio)(make-posn 450 88)(number->string(vector-ref vec 4)))
               (elegirplantas)
               
             )            
     )
    )
)
(menu inicio)
  )


;función para el contador de plantas
(define vec (vector 5 5 3 5 1))



;función para dibujar la planta dando clic en el escenario
(define ( dibujar pos-x pos-y n ventana)
  (begin
    (play-sound "sonidoclic.wav" #t)
    (((draw-pixmap-posn n)inicio)(make-posn pos-x pos-y))
  )  
)
      
(define (dibujo-clic n)
 (if(get-mouse-click inicio)
   (begin
      (if (and
         (>= (posn-x(query-mouse-posn inicio))10)
         (<= (posn-x(query-mouse-posn inicio))586)
         (<=(posn-y (query-mouse-posn inicio))106))
           (display "cuadrado"))
      (newline)
      (if (< (posn-y (query-mouse-posn inicio))100)
         (void)
         (begin
           (display "  X=")
           (display (quotient (posn-x (query-mouse-posn inicio)) 120))
           (display "  Y=")
           (display (quotient (posn-y (query-mouse-posn inicio)) 110))
           (newline)
           (dibujar (*(quotient (posn-x (query-mouse-posn inicio)) 120) 120) (*(quotient (posn-y (query-mouse-posn inicio)) 110)110) n inicio)
         )
      )
   )
 )  

)
;vectores de zombies
(define zombie1 (vector "zombie1.png" "zombie1,1.png"))
(define zombie2 (vector "zombie2.png" "zombie2,1.png"))
(define zombie3 (vector "zombie3.png" "zombie3,1.png"))
(define zombie4 (vector "zombie4.png" "zombie4,1.png"))
(define zombie5 (vector "zombie5.png"))


;vidas de los zombies
(define vzombie1(vector 5))
(define vzombie2(vector 5))
(define vzombie3(vector 5))
(define vzombie4(vector 5))
(define vzombie5(vector 5))


;funcion para elegir la planta que dispara y llamar a las funciones de los zombies
(define (reemplazar pos-x pos-y inicio cont)
 (if (< cont 600)
     (begin
       (play-sound "disparodeplantas.wav" #t)
         ((draw-solid-ellipse inicio) (make-posn pos-x (+ pos-y 30)) 30 30 "blue")
         (((draw-pixmap-posn "bala.png")inicio) (make-posn(- pos-x 5) (+ pos-y 20)))
         (zombies (+ cont 50)(+ cont 30))
         (otros (+ cont 70)(+ cont 50)(+ cont 90))
         (sleep 1)
         ((draw-solid-ellipse inicio) (make-posn (+ pos-x cont) (+ pos-y 30)) 30 30 "blue")
         (((draw-pixmap-posn "bala.png")inicio) (make-posn (+ pos-x (- cont 105))(+ pos-y 10)))
         (reemplazar pos-x pos-y inicio (+ cont 100))
         
     )
     (begin
       (((draw-pixmap-posn "bala.png")inicio) (make-posn 940 (+ pos-y 10)))
       (siguiente)
       
     )  
  )
)  
;funcion que hace mover a los zombies
(define (otros cont cont2 cont3)
  (if (>= (and (- 890 cont)(- 890 cont2)(- 890 cont3)) 90)
  (begin
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 (- cont 20)) 470))
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 (- cont2 25)) 580))
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 (- cont3 20)) 110))
    (((draw-pixmap-posn (vector-ref zombie3 0))inicio)(make-posn (- 890 cont) 480))
    (((draw-pixmap-posn (vector-ref zombie4 0))inicio)(make-posn (- 890 cont2) 590))
    (((draw-pixmap-posn (vector-ref zombie5 0))inicio)(make-posn (- 890 cont3) 130))
    (sleep 2)
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 (- cont 20)) 470))
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 (- cont2 25)) 580))
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 (- cont3 20)) 110))
    (((draw-pixmap-posn (vector-ref zombie3 1))inicio)(make-posn (- 890 (+ cont 50)) 480))
    (((draw-pixmap-posn (vector-ref zombie4 1))inicio)(make-posn (- 890 (+ cont2 50)) 590))
    (((draw-pixmap-posn (vector-ref zombie5 0))inicio)(make-posn (- 890 (+ cont3 50)) 130))
    ;(sleep 2)
    ;(otros (+ cont 70)(+ cont2 50)(+ cont3 90))
  )
  (begin
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 cont) 470))
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 cont) 570))
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 cont) 120))
    (((draw-pixmap-posn "gameover.png")inicio)(make-posn 300 300))
    (play-sound "gameover.wav" #t) 
  )
 )
)  

(define (zombies cont cont2)
  (if (>= (and (- 890 cont)(- 890 cont2)) 90)
      (begin
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 (- cont 10)) 340))
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 (- cont2 30)) 215))
    (((draw-pixmap-posn (vector-ref zombie1 0))inicio)(make-posn (- 890 cont) 350))
    (((draw-pixmap-posn (vector-ref zombie2 0))inicio)(make-posn (- 890 cont2) 235))
    (sleep 2)
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 (- cont 10)) 340))
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 (- cont2 30)) 215))
    (((draw-pixmap-posn (vector-ref zombie1 1))inicio)(make-posn (- 890 (+ cont 70)) 350))
    (((draw-pixmap-posn (vector-ref zombie2 1))inicio)(make-posn (- 890 (+ cont2 50)) 235))
     )
  (begin
    (((draw-pixmap-posn "pasto.jpg")inicio)(make-posn (- 890 cont) 340))
    (((draw-pixmap-posn "pasto2.jpg")inicio)(make-posn (- 890 cont) 220))
    (((draw-pixmap-posn "gameover.png")inicio)(make-posn 300 300))
    (play-sound "gameover.wav" #t) 
  )
  )
)  

(define (siguiente)
  (begin
  (if(get-mouse-click inicio)
     (if (< (posn-y (query-mouse-posn inicio))100)
         (void)
         (begin
           (display "  X=")
           (display (quotient (posn-x (query-mouse-posn inicio)) 100))
           (display "  Y=")
           (display (quotient (posn-y (query-mouse-posn inicio)) 100))
           (newline)
           (reemplazar 450 (*(quotient (posn-y (query-mouse-posn inicio)) 110)110) inicio 100)
           
         )
      )
   )
 ) 
)


;función para dar clic en el menu de plantas
(define (elegirplantas)
  (if (get-mouse-click inicio)
      (begin
      (if (and
         (>= (posn-x(query-mouse-posn inicio))135)
         (<= (posn-x(query-mouse-posn inicio))205)
         (>= (posn-y(query-mouse-posn inicio))10)
         (<=(posn-y (query-mouse-posn inicio))100)
         (play-sound "semilla.wav" #t))
           (begin
             ((draw-pixmap inicio) "cuadro.png" (make-posn 142 71))
             (if (>= (vector-ref vec 0) 1)
                 (begin
                   (vector-set! vec 0 (- (vector-ref vec 0) 1))
                   ((draw-string inicio)(make-posn 157 88)(number->string(vector-ref vec 0)))
                   (dibujo-clic "pea.png"))
                 (void)
             )
          )
      )
         
      (if (and
           (>= (posn-x(query-mouse-posn inicio))200)
           (<= (posn-x(query-mouse-posn inicio))270)
           (>= (posn-y(query-mouse-posn inicio))10)
           (<=(posn-y (query-mouse-posn inicio))100)
           (play-sound "semilla.wav" #t))
          (begin
            ((draw-pixmap inicio) "cuadro.png" (make-posn 215 71))
            (if (>= (vector-ref vec 1) 1)
                (begin
                  (vector-set! vec 1 (- (vector-ref vec 1)1))
                  ((draw-string inicio)(make-posn 230 88)(number->string(vector-ref vec 1)))
                  (dibujo-clic "sunflower.png"))
                (void)
            )
          )
     )     
            
      (if (and
           (>= (posn-x(query-mouse-posn inicio))272)
           (<= (posn-x(query-mouse-posn inicio))342)
           (>= (posn-y(query-mouse-posn inicio))10)
           (<=(posn-y (query-mouse-posn inicio))100)
           (play-sound "semilla.wav" #t))
          (begin
            ((draw-pixmap inicio) "cuadro.png" (make-posn 288 71))
            (if (>= (vector-ref vec 2)1)
                (begin
                  (vector-set! vec 2 (- (vector-ref vec 2)1))
                  ((draw-string inicio)(make-posn 303 88)(number->string(vector-ref vec 2)))
                  (dibujo-clic "snow_pea.png"))
                (void)
            )
        )    
      )    
      (if (and
           (>= (posn-x(query-mouse-posn inicio))347)
           (<= (posn-x(query-mouse-posn inicio))417)
           (>= (posn-y(query-mouse-posn inicio))10)
           (<=(posn-y (query-mouse-posn inicio))100)
           (play-sound "semilla.wav" #t))
          (begin
            ((draw-pixmap inicio) "cuadro.png" (make-posn 363 71))
            (if (>= (vector-ref vec 3)1)
                (begin
                   (vector-set! vec 3 (- (vector-ref vec 3)1))
                   ((draw-string inicio)(make-posn 378 88)(number->string(vector-ref vec 3)))
                   (dibujo-clic "wallnut.png"))
                (void)
            )
          )  
      )    
      (if (and
           (>= (posn-x(query-mouse-posn inicio))420)
           (<= (posn-x(query-mouse-posn inicio))490)
           (>= (posn-y(query-mouse-posn inicio))10)
           (<=(posn-y (query-mouse-posn inicio))100)
           (play-sound "semilla.wav" #t))
          (begin
            ((draw-pixmap inicio) "cuadro.png" (make-posn 435 71))
            (if (>= (vector-ref vec 4) 1)
                (begin
                    (vector-set! vec 4 (- (vector-ref vec 4)1))
                    ((draw-string inicio)(make-posn 450 88)(number->string(vector-ref vec 4)))
                    (dibujo-clic "chewrrybomb.png"))
                (void)
            )
          )  
      )
      (if (and
           (>= (posn-x(query-mouse-posn inicio))700)
           (<= (posn-x(query-mouse-posn inicio))850)
           (>= (posn-y(query-mouse-posn inicio))50)
           (<=(posn-y (query-mouse-posn inicio))100)
           (play-sound "semilla.wav" #t))
            (siguiente)
            
      )     
    )
   )
  (elegirplantas)
  (siguiente)
)

(menu inicio)
(elegirplantas)
(dibujo-clic n)