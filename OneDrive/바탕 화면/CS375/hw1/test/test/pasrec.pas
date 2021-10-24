{ pasrec.pas      program to test record operations      06 Aug 09 }

program graph1(output);
label 1492, 1776;
type complex = record re, im: real end;
     color = (red, white, blue);
     pp = ^ person;
     person = record age:      integer;
                     friend:   pp;
                     location: complex;
                     favorite: color;
                     salary:   real end;
var c,d: complex; i, sum: integer;
    ac: array[1..10] of complex;
    aco: array[1..10, color] of color;
    john, mary, fred, ptr: pp;
    people: array[1..20] of person;
begin
   new(john);
   new(mary);
   new(fred);
   john^.favorite := blue;
   john^.age := 19;
1492:
   john^.friend := mary;
   john^.salary := 40000.0;
   john^.location.re := 3;
   mary^.age := 21;
   mary^.friend := fred;
1776:
   fred^.age := 20;
   fred^.friend := nil;
   john^.friend^.friend^.location.im := 4.5;
   ac[7].re := john^.salary;
   ptr := john;
   sum := 0;
   i := 1;
   while ptr <> nil do
     begin
	sum := sum + ptr^.age;
	people[i].age := ptr^.age;
	aco[i,white] := john^.favorite;
	ptr := ptr^.friend;
	i := i + 1
     end;
   write('i = ');
   writeln(i);
   write('Sum of ages = ');
   writeln(sum);
   write('Fred loc im = ');
   writeln(fred^.location.im);
   if sum < 3 then goto 1776
end.
entype:  3  value:             color
yylex() =  266   tokentype:  0  which:    6            =
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:               red
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:             white
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:              blue
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                pp
yylex() =  266   tokentype:  0  which:    6            =
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  258   tokentype:  3  value:            person
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            person
yylex() =  266   tokentype:  0  which:    6            =
yylex() =  307   tokentype:  2  which:   20       record
yylex() =  258   tokentype:  3  value:               age
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:           integer
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            friend
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:                pp
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:          location
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:           complex
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:          favorite
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:             color
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            salary
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:              real
yylex() =  295   tokentype:  2  which:    8          end
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  314   tokentype:  2  which:   27          var
yylex() =  258   tokentype:  3  value:                 c
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:                 d
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:           complex
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                 i
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:               sum
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:           integer
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                ac
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  288   tokentype:  2  which:    1        array
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  287   tokentype:  1  which:    8           ..
yylex() =  260   tokentype:  5  type:     0           10
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  303   tokentype:  2  which:   16           of
yylex() =  258   tokentype:  3  value:           complex
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               aco
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  288   tokentype:  2  which:    1        array
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  287   tokentype:  1  which:    8           ..
yylex() =  260   tokentype:  5  type:     0           10
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:             color
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  303   tokentype:  2  which:   16           of
yylex() =  258   tokentype:  3  value:             color
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:              mary
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:              fred
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:                pp
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            people
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  288   tokentype:  2  which:    1        array
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  287   tokentype:  1  which:    8           ..
yylex() =  260   tokentype:  5  type:     0           20
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  303   tokentype:  2  which:   16           of
yylex() =  258   tokentype:  3  value:            person
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  289   tokentype:  2  which:    2        begin
yylex() =  258   tokentype:  3  value:               new
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              john
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               new
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              mary
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               new
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              fred
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          favorite
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              blue
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0           19
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  260   tokentype:  5  type:     0         1492
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              mary
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            salary
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     1 4.000000e+04
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          location
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                re
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0            3
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              mary
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0           21
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              mary
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              fred
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  260   tokentype:  5  type:     0         1776
yylex() =  282   tokentype:  1  which:    3            :
yylex() =  258   tokentype:  3  value:              fred
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0           20
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              fred
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  302   tokentype:  2  which:   15          nil
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          location
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                im
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     1 4.500000e+00
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                ac
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  260   tokentype:  5  type:     0            7
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                re
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            salary
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              john
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               sum
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0            0
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                 i
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  315   tokentype:  2  which:   28        while
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  267   tokentype:  0  which:    7           <>
yylex() =  302   tokentype:  2  which:   15          nil
yylex() =  292   tokentype:  2  which:    5           do
yylex() =  289   tokentype:  2  which:    2        begin
yylex() =  258   tokentype:  3  value:               sum
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:               sum
yylex() =  261   tokentype:  0  which:    1            +
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:            people
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  258   tokentype:  3  value:                 i
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:               age
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               aco
yylex() =  285   tokentype:  1  which:    6            [
yylex() =  258   tokentype:  3  value:                 i
yylex() =  280   tokentype:  1  which:    1            ,
yylex() =  258   tokentype:  3  value:             white
yylex() =  286   tokentype:  1  which:    7            ]
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:              john
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          favorite
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:               ptr
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:            friend
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:                 i
yylex() =  265   tokentype:  0  which:    5           :=
yylex() =  258   tokentype:  3  value:                 i
yylex() =  261   tokentype:  0  which:    1            +
yylex() =  260   tokentype:  5  type:     0            1
yylex() =  295   tokentype:  2  which:    8          end
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:             write
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  259   tokentype:  4  value:              i = 
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:           writeln
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:                 i
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:             write
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  259   tokentype:  4  value:    Sum of ages = 
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:           writeln
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:               sum
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:             write
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  259   tokentype:  4  value:    Fred loc im = 
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  258   tokentype:  3  value:           writeln
yylex() =  283   tokentype:  1  which:    4            (
yylex() =  258   tokentype:  3  value:              fred
yylex() =  272   tokentype:  0  which:   12            ^
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:          location
yylex() =  273   tokentype:  0  which:   13            .
yylex() =  258   tokentype:  3  value:                im
yylex() =  284   tokentype:  1  which:    5            )
yylex() =  281   tokentype:  1  which:    2            ;
yylex() =  300   tokentype:  2  which:   13           if
yylex() =  258   tokentype:  3  value:               sum
yylex() =  268   tokentype:  0  which:    8            <
yylex() =  260   tokentype:  5  type:     0            3
yylex() =  310   tokentype:  2  which:   23         then
yylex() =  299   tokentype:  2  which:   12         goto
yylex() =  260   tokentype:  5  type:     0         1776
yylex() =  295   tokentype:  2  which:    8          end
yylex() =  273   tokentype:  0  which:   13            .
