; patex.lsp             Gordon S. Novak Jr.           ; 31 Jan 05

; Copyright (c) 2001 Gordon S. Novak Jr. and The University of Texas at Austin

; Examples of code to be optimized.
; Most of these are GLISP compiler output, prior to optimization.
; The GLISP source functions are shown as comments.

; 09 Feb 01; 30 Jan 05

; Compare areas of two circles
; (gldefun t1 ((c circle) (d circle)) (if ((area c) > (area d)) (print 'bigger)))
(defun t1 (C D)
  (COND ((> (* PI (EXPT (CADDR (PROG1 C)) 2))
	    (* PI (EXPT (CADDR (PROG1 D)) 2)))
	  (PRINT 'BIGGER))))

; (fnopt 't1)


; Compute the "distance" between two persons in "salary as a function of age"
; coordinates.
; (gldefun t2 ((p person) (q person)) (distance-to (pasv p) (pasv q)))
(defun t2 (P Q)
  (LET ((DX (- (- (+ (CADDR (CURRENTDATE)) 1900)
		  (+ (CADDR (GET (PROG1 P) 'BIRTHDATE)) 1900))
	       (- (+ (CADDR (CURRENTDATE)) 1900)
		  (+ (CADDR (GET (PROG1 Q) 'BIRTHDATE)) 1900))))
	(DY (- (/ (GET (PROG1 P) 'SALARY) 1000.0)
	       (/ (GET (PROG1 Q) 'SALARY) 1000.0))))
       (SQRT (+ (* DX DX) (* DY DY)))))


; Test whether a pipe, with ends capped, would float in water.
; (gldefun t3 ((p pipe)) (floats p))
(defun t3 (P)
  (> (* PI (EXPT (/ (CADDR (PROG1 P)) 2) 2))
     (* (- (* PI (EXPT (/ (CADDR (PROG1 P)) 2) 2))
	   (* PI (EXPT (/ (CADR (PROG1 P)) 2) 2)))
	(GET (FIFTH (PROG1 P)) 'DENSITY))))


; A made-up example for optimizing COND.  cf. squash example in gltest.lsp
(defun t4 ()
  (cond ((> 1 3) 'amazing)
	((< (sqrt 7.2) 2) 'incredible)
	((= (+ 2 2) 4) 'okay)
	(t 'jeez)))


; Note: try to avoid materializing (consing) any data sets unnecessarily.
;
; Print the names and averages of women in a class who have high grades.
; (gldefun t5 ((c class))
;   (for s in ((women c) * (winners c))
;        (format t "~A ~A~%" (name s) (average s)) ) )
(defun t5 (C)
  (DOLIST (S (INTERSECTION
	      (SUBSET #'(LAMBDA (GLVAR7289)
				(EQ (GET (PROG1 GLVAR7289) 'SEX)
				    'FEMALE))
		      (GET (PROG1 C) 'STUDENTS))
	      (SUBSET #'(LAMBDA (GLVAR7290)
				(>=
				 (STUDENT-AVERAGE (PROG1 GLVAR7290))
				 95))
		      (GET (PROG1 C) 'STUDENTS))))
	  (FORMAT T "~A ~A~%" (GET S 'NAME) (STUDENT-AVERAGE S))))


; Test whether a line on the screen is being selected by the mouse.
; (gldefun draw-line-selectedp ((d draw-line) (pt vector) (off vector))
;   (let ((ptp (pt - off)))
;     (and (contains? (vregion d) ptp)         ; is point in region near line
;          ((distance (line d) ptp) < 5) ) ))  ; and within distance of 5
(defun t6 (D PT OFF)
  (LET ((PTP (LIST (- (CAR (PROG1 PT)) (CAR (PROG1 OFF)))
		   (- (CADR (PROG1 PT)) (CADR (PROG1 OFF))))))
       (AND (AND (>= (CAR (PROG1 PTP))
		     (- (MIN (CAR (CADR (PROG1 D)))
			     (+ (CAR (CADR (PROG1 D)))
				(CAR (CADDR (PROG1 D)))))
			2))
		 (<= (CAR (PROG1 PTP))
		     (+ (- (MIN (CAR (CADR (PROG