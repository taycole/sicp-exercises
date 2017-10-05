					;-- test code



					;-- Problems 1.2


(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

					;--- Problem 1.3

(define (f a b c)
  (cond ((and (> a b) (> b c)) (+ (* a a) (* b b)))
        ((and (> a b) (> c b)) (+ (* a a) (* c c)))
        (else (+ (* b b) (* c c)))))

(f 7 3 6)


					;--- Problem 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define n (a-plus-abs-b 1 5))
(define m (a-plus-abs-b 1 (- 5)))

n
m
(= n m)

					;--- Problem 1.5




					;--- Problem 1.6 in sqrt file


					;--- Problem 1.7

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (good-enough2? guess x)
  (< (abs (- guess (improve guess x))) (/ guess 1000000000000000000.0)))
  


(define (sqrt-iter guess x)
  (if (good-enough2? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
(square (sqrt 2))

(sqrt 4)
(square (sqrt 4))

(sqrt (/ 3.0 800000))
(square (sqrt (/ 3.0 800000)))

(sqrt 10000000000)
(square (sqrt 10000000000))


					;--- Problem 1.8

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))


(define (good-stuff? guess x)
  (< (abs (- guess (improve guess x))) (/ guess (expt 10 200))))


(define (cube-rootier guess x)
  (if (good-stuff? guess x)
      guess
      (cube-rootier (improve guess x) x)))

(define (cbrt x)
  (cube-rootier 1.0 x))


(define (testcr x)
  (list (cbrt x) (expt (cbrt x) 3)))

(testcr 8)

(testcr 27)

(testcr (/ 1.0 100000000000000))

(testcr 60000000000000)

					;---


(define (root r x)
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (improve guess)
    (cond ((= r 2)
	   (average guess (/ x guess)))
	  ((= r 3)
	   (/ (+ (/ x (square guess)) (* 2 guess)) 3))))

  (define (good-enough? guess)
    (< (abs (- (improve guess) guess)) (/ guess (expt 10 100))))

  (define (root-loop guess)
    (if (good-enough? guess)
	guess
	(root-loop (improve guess))))

  (root-loop 1.0))

(root 2 25)
(root 2 4)
(root 2 2)
(root 2 (expt 52525 2))

(root 3 8)
(root 3 125)
(root 3 2)
(root 3 (expt 12345 3))




					;-- Exercise 1.9

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))


(define (add_1 a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b)))) ; ((a-1) + b) + 1

#|
a,b = 4,5
(inc (+ (dec 4) 5))
(inc (+ (- 4 1) 5))
(inc (+ 3 5))
(inc 8)
(+ 8 1)
9
|#



(define (add_2 a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b)))) ; (a-1) + (b+1)

#|
(+ (dec 4) (inc 5))
(+ (- 4 1) (+ 5 1))
(+ 3 6)
9
|#


;--- Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

(A 1 10) ;=1024, 2^10
(A 2 4)  ;=65536, 2^16, 4^8    2a^ab
(A 3 3)  ;=65536, 2^16
