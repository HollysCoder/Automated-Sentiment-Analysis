//       GSN    14 Oct 08
// 

final class associative
{
    public static void main(String args[]) {
        double a = 1.0;
        double e = 1.0e-15;
        if ( (a + (e + e)) == ((a + e) + e) )
            System.out.println("Worked for this case.");
        else System.out.println("Floating + is not associative.");
   }
}
ff     0
(FUNCTION real
          real)
   ... lots more ...
Symbol table level 1
 25590736           i  VAR    0 typ integer  lvl  1  siz     4  off     0
 25590832         lim  VAR    0 typ integer  lvl  1  siz     4  off     4
 token 25592784  OP       program  dtype  0  link 0  operands 25589968
(program graph1 (progn output)
                (progn (:= lim 7)
                       (progn (:= i 0)
                              (label 0)
                              (if (<= i lim)
                                  (progn (funcall writeln '*')
                                         (:= i (+ i 1))
                                         (goto 0))))))
