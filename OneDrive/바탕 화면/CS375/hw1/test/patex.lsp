{ Compute a square root by Newton's method  -- file passqrt.pas }

program graph1(output);
var  s, x: real; i: integer;
begin
   s := 3.0;
   x := 1.0;
   for i:=1 to 5 do
       x := 0.5 * (x + s/x);
   writelnf(x)
end.
R  val  1
 25998032        blue  CONST  typ INTEGER  val  2
 25998224       color  TYPE   typ 25998128  lvl  1  siz     4  off     0
  0 ..   2
 25998640      person  TYPE   typ 26000944  lvl  1  siz    48  off     0
(RECORD (age integer)
        (friend (^ person))
        (location (RECORD (re real)
                          (im real)))
        (favorite   0 ..   2)
        (salary real))
 25998832          pp  TYPE   typ 25998736  lvl  1  siz     8  off     0
(^ person)
 26001552           c  VAR    0 typ 25996944  lvl  1  siz    16  off     0
(RECORD (re real)
        (im real))
 26001648           d  VAR    0 typ 25996944  lvl  1  siz    16  off    16
(RECORD (re real)
        (im real))
 26002128           i  VAR    0 typ integer  lvl  1  siz     4  off    32
 26002224         sum  VAR    0 typ integer  lvl  1  siz     4  off    36
 26003216          ac  VAR    0 typ 26003120  lvl  1  siz   160  off    48
(ARRAY   1 ..  10 (RECORD (re real)
                          (im real)))
 26004432         aco  VAR    0 typ 26004336  lvl  1  siz   120  off   208
(ARRAY   1 ..  10 (ARRAY   0 ..   2   0 ..   2))
 26005168        john  VAR    4 typ 25998736  lvl  1  siz     8  off   328
(^ person)
 26005264        mary  VAR    4 typ 25998736  lvl  1  siz     8  off   336
(^ person)
 26005360        fred  VAR    4 typ 25998736  lvl  1  siz     8  off   344
(^ person)
 26005456         ptr  VAR    4 typ 25998736  lvl  1  siz     8  off   352
(^ person)
 26006448      people  VAR    0 typ 26006352  lvl  1  siz   960  off   368
(ARRAY   1 ..  20 (RECORD (age integer)
                          (friend (^ person))
                          (location (RECORD (re real)
                                            (im real)))
                          (favorite   0 ..   2)
                          (salary real)))
 token 26022096  OP       program  dtype  0  link 0  operands 25995472
(program graph1 (progn output)
                (progn (:= john (funcall new 48))
                       (:= mary (funcall new 48))
                       (:= fred (funcall new 48))
                       (:= (aref (^ john)
                                 32)
                           2)
                       (:= (aref (^ john)
                                 0)
                           19)
                       (progn (label 1)
                              (:= (aref (^ john)
                                        8)
                                  mary))
                       (:= (aref (^ john)
                                 40)
                           4.000000e+04)
                       (:= (aref (^ john)
                                 16)
                           3.000000e+00)
                       (:= (aref (^ mary)
                                 0)
                           21)
                       (:= (aref (^ mary)
                                 8)
                           fred)
                       (progn (label 0)
                              (:= (aref (^ fred)
                                        0)
                                  20))
                       (:= (aref (^ fred)
                                 8)
                           0)
                       (:= (aref (^ (aref (^ (aref (^ john)
                                                   8))
                                          8))
                                 24)
                           4.500000e+00)
                       (:= (aref ac 96)
                           (aref (^ john)
                                 40))
                       (:= ptr john)
                       (:= sum 0)
                       (:= i 1)
                       (progn (label 2)
                              (if (<> ptr 0)
                                  (progn (:= sum (+ sum (aref (^ ptr)
                                                              0)))
                                         (:= (aref people (+ -48
                                                             (* 48
                                                                i)))
                                             (aref (^ ptr)
                                                   0))
                                         (:= (aref aco (+ -8
                                                          (* 12
                                                             i)))
                                             (aref (^ john)
                                                   32))
                                         (:= ptr (aref (^ ptr)
                                                       8))
                                         (:= i (+ i 1))
                                         (goto 2))))
                       (funcall write 'i = ')
                       (funcall writelni i)
                       (funcall write 'Sum of ages = ')
                       (funcall writelni sum)
                       (funcall write 'Fred loc im = ')
                       (funcall writelnf (aref (^ fred)
                                               24))
                       (if (< sum 3)
                           (goto 0))))
