;; Xiana Lara
;; 11 18 2020
;; Running a writing a lisp program 
;; CODE APAPTED FROM SHAUN COOPER
;; input : 
;; output : 

;; evaluates a circuit design

;; NOT CD1
(define(evalcd CD)
    ;; base case
    (cond ((null? CD) '()) 
          ;; true false or A1 .. A1000
          ((not (list? CD)) CD)
          ((eq? (car CD) 'NOT) (evalcd_not CD))
          ((eq? (car CD) 'AND) (evalcd_and CD))
          ((eq? (car CD) 'OR ) (evalcd_or CD))
    )
)
;; PRE:MUST be a (NOT CD) form (CAR CD) => NOT
;; reduce the Argument and see if we can reduce it
(define (evalcd_not CD)
    (cond ((eq? (evalcd (cadr CD)) 0) 1)
          ((eq? (evalcd (cadr CD)) 1) 0)
          (else (cons 'NOT (list (evalcd (cadr CD)))))
    )
)
;; PRE:MUST be (AND CD1 CD2) format
;; post apply simple tautologies to the CD1 and CD2 and may be reduced
;; AND
(define(evalcd_and CD)
    (cond ((eq? (evalcd (cadr CD)) 0) 0)
          ((eq? (evalcd (caddr CD)) 0) 0)
          ((eq? (evalcd (cadr CD)) 1) (evalcd (caddr CD)))
          ((eq? (evalcd (caddr CD)) 1) (evalcd (cadr CD)))
          (else (cons 'And 
                        (list (evalcd (cadr CD))
                                (evalcd (caddr CD))
                        )
                  )
          )
    )
)

;; PRE:Must be (OR CD1 CD2) format
;; post apply simple tautologies to the CD1 and CD2 and may be reduced
;; OR
(define(evalcd_or CD)
     (cond ((eq? (evalcd(cadr CD)) 1) 1)
           ((eq? (evalcd(caddr CD)) 1) 1)
          ((eq? (evalcd(cadr CD)) 0)(evalcd (caddr CD)))
          ((eq? (evalcd(caddr CD)) 0)(evalcd (cadr CD)))
          (else (cons 'OR 
                        (list (evalcd(cadr CD))
                                (evalcd(caddr CD))
                        )
                  )
          )
    )
) 

;; a function which uniquely lists all of the input VARIABLES
(define(unique lst)
    (cond 
        ((null? lst) '())
        ((not (list? lst)) '())
        ((member(car lst)(cdr lst))(unique(cdr lst)))
        (else
            (cons 
                (car lst)(unique(cdr lst))
            ) 
        )
    )         
) 

;; a function that given a CD, reduces, the CD 
;; to a simpler form by using tautologies
(define (findinvars lst)
    (cond
        ((null? lst) '())               
        ((not(list? lst)) '())         
        ((or (eq? (car lst) 1)
             (eq? (car lst) 0)
             (eq? (car lst) 'AND)
             (eq? (car lst) 'OR)
             (eq? (car lst) 'NOT)
             ) 
            (findinvars (cdr lst))
        ) 
        (else                          
            (cons (car lst) (findinvars (cdr lst)))))
)

;; a function which counts the number of times a logical 
;; operator is used in a a CD
(define(count-operator x lst)
    (cond
        ((null? lst) 0)
        ((not (list? lst))
            (if(eq? x lst) 1 0)
        )
        (else
            (+
                (count-operator x (car lst))(count-operator x (cdr lst))
            )
        )
    )
)
