{ program 4.9 from Jensen & Wirth       -- file graph1.pas }

program graph1(output);
const d = 0.0625; {1/16, 16 lines for interval [x,x+1]}
      s = 32; {32 character widths for interval [y,y+1]}
      h = 34; {character position of x-axis}
      c = 6.28318; {2*pi}  lim = 32;
var x,y : real;  i,n : integer;
begin
   for i := 0 to lim do
      begin x := d*i; y := exp(-x)*sin(c*x);
      n := iround(s*y) + h;
      repeat write(' ');  n := n-1
      until n=0;
      writeln('*')
   end
end.
real)
 38028240         sin  knd 5 0  typ 38028336  lvl  0  siz     0  off     0
(FUNCTION real
          real)
   ...
Symbol table level 1
 38050576           d  CONST  typ    REAL  val  6.250000e-02
 38050928           s  CONST  typ INTEGER  val  32
 38051280           h  CONST  typ INTEGER  val  34
 38051632           c  CONST  typ    REAL  val  6.283180e+00
 38051984         lim  CONST  typ INTEGER  val  32
 38052592           x  VAR    1 typ    real  lvl  1  siz     8  off     0
 38052688           y  VAR    1 typ    real  lvl  1  siz     8  off     8
 38053168           i  VAR    0 typ integer  lvl  1  siz     4  off    16
 38053264           n  VAR    0 typ integer  lvl  1  siz     4  off    20
 token 38058544  OP       program  dtype  0  link 0  operands 38050000
(program graph1 (progn output)
                (progn (:= i 0)
                       (label 1)
                       (if (<= i 32)
                           (progn (:= x (* 6.250000e-02
                                           (float i)))
                                  (:= y (* (funcall exp (- x))
                                           (funcall sin (* 6.283180e+00
                                                           x))))
                                  (:= n (fix (+ (funcall round (* 3.200000e+01
                                                                  y))
                                                3.400000e+01)))
                                  (progn (label 0)
                                         (funcall write ' ')
                                         (:= n (- n 1))
                                         (if (= n 0)
                                             (progn)
                                             (goto 0)))
                                  (funcall writeln '*')
                                  (:= i (+ i 1))
                                  (goto 1)))))


Your version may look like this, also okay:

(program graph1 (progn output)
         (progn (progn (:= i 0)
                       (label 1)
                       (if (<= i 32)
                           (progn (progn (:= x (* 6.250000e-02
                                                  (float i)))
                                         (:= y (* (funcall exp (- x))
                                                  (funcall sin (* 6.283180e+00
                                                                  x))))
                                         (:= n (fix (+ (funcall round
                                                                (* 3.200000e+01
                                                                   y))
                                                       3.400000e+01)))
                                         (progn (label 0)
                                                (progn (funcall write ' ')
                                                       (:= n (- n 1)))
                                                (if (= n 0)
                                                    (progn)
                                                    (goto 0)))
                                         (funcall writeln '*'))
                                  (:= i (+ i 1))
                                  (goto 1))))))

If you use graph1i.pas (which uses iround() instead of round() ):

(program graph1 (progn output)
                (progn (:= i 0)
                       (label 1)
                       (if (<= i 32)
                           (progn (:= x (* 6.250000e-02
                                           (float i)))
                                  (:= y (* (funcall exp (- x))
                                           (funcall sin (* 6.283180e+00
                                                           x))))
                                  (:= n (+ (funcall iround (* 3.200000e+01
                                                              y))
                                           34))
                                  (progn (label 0)
                                         (funcall write ' ')
                                         (:= n (- n 1))
                                         (if (= n 0)
                                             (progn)
                                             (goto 0)))
                                  (funcall writeln '*')
                                  (:= i (+ i 1))
                                  (goto 1)))))
