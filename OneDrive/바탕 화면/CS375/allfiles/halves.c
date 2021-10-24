
typedef struct dtoi {
union {double dbl; long iarr[2]; } val; } Dtoi;

Dtoi dtoitmp;

/* Get half words of a double float */
long lefth(d)
  double d;
  {  dtoitmp.val.dbl = d;
     return ( dtoitmp.val.iarr[0]); }

long righth(d)
  double d;
  {  dtoitmp.val.dbl = d;
     return ( dtoitmp.val.iarr[1]); }

er;
begin
   for i := 0 to lim do
      begin x := d*i; y := exp(-x)*sin(c*x);
      n := iround(s*y) + h;
      repeat write(' ');  n := n-1
      until n=0;
      writeln('*')
   end
end.
