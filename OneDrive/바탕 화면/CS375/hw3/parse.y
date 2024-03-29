%{     /* pars1.y    Pascal Parser      Gordon S. Novak Jr.  ; 25 Jul 19   */

/* Copyright (c) 2019 Gordon S. Novak Jr. and
   The University of Texas at Austin. */
/*
    Name: Byungik Hyun
    EID: bh26948
*/

/* 14 Feb 01; 01 Oct 04; 02 Mar 07; 27 Feb 08; 24 Jul 09; 02 Aug 12 */
/* 30 Jul 13 */

/*
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program; if not, see <http://www.gnu.org/licenses/>.
  */


/* NOTE:   Copy your lexan.l lexical analyzer to this directory.      */

       /* To use:
                     make pars1y              has 1 shift/reduce conflict
                     pars1y                   execute the parser
                     i:=j .
                     ^D                       control-D to end input

                     pars1y                   execute the parser
                     begin i:=j; if i+j then x:=a+b*c else x:=a*b+c; k:=i end.
                     ^D

                     pars1y                   execute the parser
                     if x+y then if y+z then i:=j else k:=2.
                     ^D

           You may copy pars1.y to be parse.y and extend it for your
           assignment.  Then use   make parser   as above.
        */

        /* Yacc reports 1 shift/reduce conflict, due to the ELSE part of
           the IF statement, but Yacc's default resolves it in the right way.*/

#include <stdio.h>
#include <ctype.h>
#include "token.h"
#include "lexan.h"
#include "symtab.h"
#include "parse.h"
#include "pprint.h"

        /* define the type of the Yacc stack element to be TOKEN */

#define YYSTYPE TOKEN

TOKEN parseresult;

%}

/* Order of tokens corresponds to tokendefs.c; do not change */

%token IDENTIFIER STRING NUMBER   /* token types */

%token PLUS MINUS TIMES DIVIDE    /* Operators */
%token ASSIGN EQ NE LT LE GE GT POINT DOT AND OR NOT DIV MOD IN

%token COMMA                      /* Delimiters */
%token SEMICOLON COLON LPAREN RPAREN LBRACKET RBRACKET DOTDOT

%token ARRAY BEGINBEGIN           /* Lex uses BEGIN */
%token CASE CONST DO DOWNTO ELSE END FILEFILE FOR FUNCTION GOTO IF LABEL NIL
%token OF PACKED PROCEDURE PROGRAM RECORD REPEAT SET THEN TO TYPE UNTIL
%token VAR WHILE WITH


%%

program    : PROGRAM IDENTIFIER LPAREN idlist RPAREN SEMICOLON vblock DOT { parseresult = makeprogram($2, $4, $7); } ;
             ;
  statement  :  BEGINBEGIN statement endpart   { $$ = makeprogn($1,cons($2, $3)); }
             |  IF expr THEN statement endif   { $$ = makeif($1, $2, $4, $5); }
             |  assignment
             |  funcall
             |  FOR assignment TO expr DO statement   { $$ = makefor(1, $1, $2, $3, $4, $5, $6); }
             ;
  
  vblock     :  VAR varspecs block       { $$ = $3; }
             |  block
             ;
  varspecs   :  vargroup SEMICOLON varspecs
             |  vargroup SEMICOLON
             ;
  idlist     :  IDENTIFIER COMMA idlist { $$ = cons($1, $3); }
             |  IDENTIFIER    { $$ = cons($1, NULL); }
             ;
  vargroup   :  idlist COLON type { instvars($1, $3); }
             ;
  block      :  BEGINBEGIN statement endpart   { $$ = makeprogn($1,cons($2, $3)); }  
             ;
  type       :  simpletype
             ;
  simpletype :  IDENTIFIER   { $$ = findtype($1); }
             ;
  funcall    :  IDENTIFIER LPAREN expr_list RPAREN    { $$ = makefuncall($2, $1, $3); }
             ;
  expr_list  :  expr COMMA expr_list           { $$ = cons($1, $3); }
             |  expr
             ;
  endpart    :  SEMICOLON statement endpart    { $$ = cons($2, $3); }
             |  END                            { $$ = NULL; }
             ;
  endif      :  ELSE statement                 { $$ = $2; }
             |  /* empty */                    { $$ = NULL; }
             ;
  assignment :  IDENTIFIER ASSIGN expr         { $$ = binop($2, $1, $3); }
             ;
  expr       :  expr PLUS term                 { $$ = binop($2, $1, $3); }
             |  term 
             ;
  factor     :  LPAREN expr RPAREN             { $$ = $2; }
             |  IDENTIFIER
             |  NUMBER
             |  STRING
             ;
  term       :  term TIMES factor              { $$ = binop($2, $1, $3); }
             |  factor
             ;



%%

/* You should add your own debugging flags below, and add debugging
   printouts to your programs.

   You will want to change DEBUG to turn off printouts once things
   are working.
  */

#define DEBUG        31             /* set bits here for debugging, 0 = off  */
#define DB_CONS       1             /* bit to trace cons */
#define DB_BINOP      2             /* bit to trace binop */
#define DB_MAKEIF     4             /* bit to trace makeif */
#define DB_MAKEPROGN  8             /* bit to trace makeprogn */
#define DB_PARSERES  16             /* bit to trace parseresult */
#define DB_MAKENUM      3
#define DB_MAKELABEL    3
#define DB_MAKEPROGRAM  3
#define DB_MAKECOPY     3
#define DB_MAKEGOTO     3
#define DB_MAKEOP       3
#define DB_MAKEFOR      1
#define DB_MAKEFUNCALL  1

 int labelnumber = 0;  /* sequential counter for internal label numbers */

   /*  Note: you should add to the above values and insert debugging
       printouts in your routines similar to those that are shown here.     */

TOKEN cons(TOKEN item, TOKEN list)           /* add item to front of list */
  { item->link = list;
    if (DEBUG & DB_CONS)
       { printf("cons\n");
         dbugprinttok(item);
         dbugprinttok(list);
       };
    return item;
  }

TOKEN binop(TOKEN op, TOKEN lhs, TOKEN rhs)        /* reduce binary operator */
  { op->operands = lhs;          /* link operands to operator       */
    lhs->link = rhs;             /* link second operand to first    */
    rhs->link = NULL;            /* terminate operand list          */
    if (DEBUG & DB_BINOP)
       { printf("binop\n");
         dbugprinttok(op);
         dbugprinttok(lhs);
         dbugprinttok(rhs);
       };
    return op;
  }

TOKEN makeif(TOKEN tok, TOKEN exp, TOKEN thenpart, TOKEN elsepart)
  {  tok->tokentype = OPERATOR;  /* Make it look like an operator   */
     tok->whichval = IFOP;
     if (elsepart != NULL) elsepart->link = NULL;
     thenpart->link = elsepart;
     exp->link = thenpart;
     tok->operands = exp;
     if (DEBUG & DB_MAKEIF)
        { printf("makeif\n");
          dbugprinttok(tok);
          dbugprinttok(exp);
          dbugprinttok(thenpart);
          dbugprinttok(elsepart);
        };
     return tok;
   }

TOKEN makeop(int op){
    TOKEN token = (TOKEN)talloc();
    token->tokentype = OPERATOR;
    token->whichval = op;
    if (DEBUG & DB_MAKEOP) {
      printf("makeop\n");
      dbugprinttok(token);
    }
    return token;
}

TOKEN copytok(TOKEN target) {
  TOKEN copyToken = talloc();
  copyToken->tokentype = target->tokentype;
  copyToken->basicdt = target->basicdt;
  copyToken->symentry = target->symentry;
  copyToken->symtype = target->symtype;
  copyToken->realval = target->realval;
  copyToken->intval = target->intval;
  copyToken->link = target->link;
  copyToken->whichval = target->whichval;
  if (DEBUG & DB_MAKECOPY) {
    printf("copytok\n");
    dbugprinttok(copyToken);
  }
  return copyToken;
}

TOKEN makenum(int number) {
  TOKEN token = talloc();
  token->tokentype = NUMBERTOK;
  token->basicdt = INTEGER;
  token->intval = number;
  if (DEBUG & DB_MAKENUM) {
      printf("makenum\n");
      dbugprinttok(token);
  }
  return token;
}


TOKEN makelabel() {
  TOKEN token = talloc();
  token->tokentype = OPERATOR;
  token->whichval = LABELOP;
  token->operands = makenum(labelnumber++);
  if (DEBUG & DB_MAKELABEL) {
      printf("makelabel\n");
      dbugprinttok(token);
  }
  return token;
}

TOKEN makegoto(int num){
  TOKEN token = talloc();
  token->tokentype = OPERATOR;
  token->whichval = GOTOOP;
  token->operands = makenum(num);
  if (DEBUG && DB_MAKEGOTO) {
      printf("makegoto\n");
      dbugprinttok(token);
  }
  return token;
}

TOKEN makefor(int sign, TOKEN tok, TOKEN assign, TOKEN tokb, TOKEN expr, TOKEN tokc, TOKEN statements) {
    tok = makeprogn(tok, assign);
    TOKEN labelTok = makelabel();
    int current = labelnumber - 1;
    assign->link = labelTok;

    TOKEN ifs = talloc();
    TOKEN body = talloc();
    body = makeprogn(body, statements);

    TOKEN opTok = makeop(LEOP);
    ifs = makeif(ifs, opTok, body, NULL);
    TOKEN copyToken= copytok(assign->operands);
    TOKEN copyTok2 = copytok(copyToken);
    TOKEN copyTok3 = copytok(copyToken);
    copyToken->link = expr;
    opTok->operands = copyToken;

    TOKEN assgn = makeop(ASSIGNOP);
    TOKEN increment = makeop(PLUSOP);

    copyTok3->link=makenum(1);
    increment->operands=copyTok3;
    copyTok2->link=increment;
    assgn->operands=copyTok2;

    TOKEN gototok = makegoto(current);
    assgn->link = gototok;
    statements->link = assgn;

    opTok->link = body;
    ifs->operands = opTok;
    labelTok->link = ifs;
    if (DEBUG && DB_MAKEFOR) {
         printf("makefor\n");
         dbugprinttok(tok);
    }
    return tok;
}

TOKEN makefuncall(TOKEN tok, TOKEN fn, TOKEN args) {
  tok->tokentype = OPERATOR;
  tok->whichval = FUNCALLOP;
  tok->operands = fn;
  fn->link=args;
  if (DEBUG && DB_MAKEFUNCALL) {
         printf("makefuncall\n");
         dbugprinttok(tok);
  }
  return tok;
}

TOKEN makeprogram(TOKEN name, TOKEN args, TOKEN statements) {
    TOKEN token = talloc();
    TOKEN nameToArgs = talloc();
    token->tokentype = OPERATOR;
    token->whichval = PROGRAMOP;
    token->operands = name;
    nameToArgs = makeprogn(nameToArgs, args);
    name->link = nameToArgs;
    nameToArgs->link = statements;
    if (DEBUG & DB_MAKEPROGRAM) { 
      printf("makeprogram\n");
      dbugprinttok(token);
      dbugprinttok(nameToArgs);
    };
    return token;
}

TOKEN makeprogn(TOKEN tok, TOKEN statements)
  {  tok->tokentype = OPERATOR;
     tok->whichval = PROGNOP;
     tok->operands = statements;
     if (DEBUG & DB_MAKEPROGN)
       { printf("makeprogn\n");
         dbugprinttok(tok);
         dbugprinttok(statements);
       };
     return tok;
   }

TOKEN findid(TOKEN tok) {
    SYMBOL sym, typ;
    sym = searchst(tok->stringval);
    tok->symentry = sym;
    typ = sym->datatype;
    tok->symtype = typ;
    if ( typ->kind == BASICTYPE ||
         typ->kind == POINTERSYM)
        tok->basicdt = typ->basicdt;
    return tok;
}

TOKEN findtype(TOKEN tok) {
    SYMBOL sym = searchst(tok->stringval);
    tok->symtype = sym;
    return tok;
  }


void instvars(TOKEN idlist, TOKEN typetok)
  {  SYMBOL sym, typesym; int align;
     typesym = typetok->symtype;
     align = alignsize(typesym);
     while ( idlist != NULL )
       {  sym = insertsym(idlist->stringval);
          sym->kind = VARSYM;
          sym->offset =
              wordaddress(blockoffs[blocknumber],
                          align);
          sym->size = typesym->size;
          blockoffs[blocknumber] =
                         sym->offset + sym->size;
          sym->datatype = typesym;
          sym->basicdt = typesym->basicdt;
          idlist = idlist->link;
        };
  }



int wordaddress(int n, int wordsize)
  { return ((n + wordsize - 1) / wordsize) * wordsize; }
 
void yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

int main(void)          /*  */
  { int res;
    initsyms();
    res = yyparse();
    printst();       /* to shorten, change to:  printstlevel(1);  */
    printf("yyparse result = %8d\n", res);
    if (DEBUG & DB_PARSERES) dbugprinttok(parseresult);
    ppexpr(parseresult);           /* Pretty-print the result tree */
    /* uncomment following to call code generator. */
     /* 
    gencode(parseresult, blockoffs[blocknumber], labelnumber);
 */
  }
