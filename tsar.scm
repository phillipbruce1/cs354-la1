; equals? function
; Compares two values to see if they are equal. Goes recursively if they are pairs or lists.
; 
; subj - first value to be compared
; serch - second value to be compared
(define (equals? subj srch)
    (cond ((and (pair? subj) (pair? srch))  ; if both are pairs
        (if (eq? (car subj) (car srch))   ; if both pairs, compare cars and call function again
            (equals? (cdr subj) (cdr srch))   ; return the output of equals? again
            #f))    ; if their cars are not the same, retun false
    ((not (or (pair? subj) (pair? srch)))   ; if neither are pairs
        (eq? subj srch))    ; return their eq?
    (else #f))) ; if one is a pair and the other is not, return false as they are not equal

; checkRandom function
; Replaces all occurences of 'RANDOM with a random int from 0-100
; 
; subj - list/value to be searched and replaced
(define (checkRandom subj)
    (cond ((null? subj) ; if subj is null
        '())    ; return null
    ((not (pair? subj)) ; if subj is not a pair
        (if (equals? subj 'RANDOM) ; if subj is 'RANDOM
            (random 100)    ; return a random int
            subj))  ; else return subj
    ((null? (car subj)) ; if subj is a pair and its car is null
        '())    ; return null
    ((equals? (car subj) 'RANDOM)  ; if car subj is 'RANDOM
        (cons (random 100) (checkRandom (cdr subj))))    ; return a random int and call tsar on cdr subj
    (else
        (cons (car subj) (checkRandom (cdr subj))))))    ; else return car subj and call tsar on cdr subj

; tsar function - Tree Search And Replace
; Replace all occurences of the sublist value srch with copies
; of the replacement value repl.
; NOTES:
; - Should be recursive I think
;   - If car == srch, replace it
; 
; subj - tree (i.e. scheme list)
; srch - sublist to be replaced
; repl - value to replace srch
(define (tsar subj srch repl)
    (cond ((null? subj) ; if subj is null
        '())    ; return null
    ((not (pair? subj)) ; if subj is not a pair
        (if (equals? subj srch) ; if subj and srch are equal
            (checkRandom repl)    ; return repl
            subj))  ; else return subj
    ((null? (car subj)) ; if subj is a pair and its car is null
        '())    ; return null
    ((equals? (car subj) srch)  ; subj and srch are pairs. if they are equal
        (cons (checkRandom repl) (tsar (cdr subj) srch repl)))    ; return repl and call tsar on cdr subj
    (else
        (if (pair? (car subj))
            (cons (tsar (car subj) srch repl) (tsar (cdr subj) srch repl))
            (cons (car subj) (tsar (cdr subj) srch repl))))))    ; else return car subj and call tsar on cdr subj

; ======TEST CASES======

(display "'x 'x 'y'\n")
(display (tsar 'x 'x 'y))
(display "\n'() 'x 'y\n")
(display (tsar '() 'x 'y))
(display "\n'(x x) 'x 'z\n")
(display (tsar '(x x) 'x 'z))
(display "\n'(x x) '(y y) 'z\n")
(display (tsar '(x x) '(y y) 'z))
(display "\n'(x (y y) z) '(y y) 'z\n")
(display (tsar '(x (y y) z) '(y y) 'z))
(display "\n'(x (x) ((x)) z) '(x) '()\n")
(display (tsar '(x (x) ((x)) z) '(x) '()))
(display "\n'(x (x) ((x)) z) '(x) '(RANDOM y))\n")
(display (tsar '(x (x) ((x)) z) '(x) '(RANDOM y)))
(display "\n'(x (x) ((x)) z) '(x) '(RANDOM RANDOM))\n")
(display (tsar '(x (x) ((x)) z) '(x) '(RANDOM RANDOM)))
(display "\n")