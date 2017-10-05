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
