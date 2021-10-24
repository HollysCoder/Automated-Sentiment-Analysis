// Name: Byungik Hyun
// EID: bh26948
/* lex1.c         14 Feb 01; 31 May 12; 11 Jan 18       */

/* This file contains code stubs for the lexical analyzer.
   Rename this file to be lexanc.c and fill in the stubs.    */

/* Copyright (c) 2018 Gordon S. Novak Jr. and
   The University of Texas at Austin. */

/*
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "token.h"
#include "lexan.h"

/* This file will work as given with an input file consisting only
   of integers separated by blanks:
   make lex1
   lex1
   12345 123    345  357
   */

char *delimiters[] = {" ", ",", ";", ":", "(", ")", "[", "]", ".."};

char *operators[] = {" ", "+", "-", "*", "/", ":=", "=", "<>", "<",
                     "<=", ">=", ">", "^", ".", "and", "or", "not",
                     "div", "mod", "in"};

char *reservedWords[] = {" ", "array", "begin", "case", "const", "do", "downto",
                         "else", "end", "file", "for", "function", "goto",
                         "if", "label", "nil", "of", "packed", "procedure",
                         "program", "record", "repeat", "set", "then", "to",
                         "type", "until", "var", "while", "with"};

/* Skip blanks and whitespace.  Expand this function to skip comments too. */
void skipblanks()
{
  int c;
  int c2;
  while ((c = peekchar()) != EOF)
  {
    if (c == ' ' || c == '\n' || c == '\t')
    {
      getchar();
    }
    else if (c == '{')
    {
      while ((c = peekchar()) != EOF && (c != '}'))
      {
        getchar();
      }
      getchar();
    }
    else if (c == '(' && (c2 = peek2char()) != EOF && c2 == '*')
    {
      getchar();
      getchar();

      while ((c = peekchar()) != EOF && (c2 = peek2char()) != EOF && !(c == '*' && c2 == ')'))
      {
        getchar();
      }

      getchar();
      getchar();
    }
    else
    {
      break;
    }
  }
}

int findDelimiter(char *str)
{
  //static char *delimiter[] = {"  ", ",", ";", ":", "(", ")", "[", "]", ".."};
  int i = 0;
  int size = sizeof(delimiters) / sizeof(char *);

  for (i = 1; i < size; i++)
  {
    if (strcmp(str, delimiters[i]) == 0)
    {
      return i;
    }
  }
  return 0;
}

int findOperator(char *str)
{
  /*static char *operator[] = {" ", "+", "-", "*", "/", ":=", "=", "<>", "<",
                             "<=", ">=", ">", "^", ".", "and", "or", "not", "div", "mod", "in",
                             "if", "goto", "progn", "label", "funcall", "aref", "program",
                             "float"};*/
  int i = 0;
  int size = sizeof(operators) / sizeof(char *);

  for (i = 1; i < size; i++)
  {
    if (strcmp(str, operators[i]) == 0)
    {
      return i;
    }
  }
  return 0;
}

int findReservedWords(char *str)
{
  /*static char *reserve[] = {" ", "array", "begin", "case", "const", "do",
                            "downto", "else", "end", "file", "for", "function", "goto", "if",
                            "label", "nil", "of", "packed", "procedure", "program", "record",
                            "repeat", "set", "then", "to", "type", "until", "var", "while",
                            "with"};*/
  int i = 0;
  int size = sizeof(reservedWords) / sizeof(char *);

  for (i = 1; i < size; i++)
  {
    if (strcmp(str, reservedWords[i]) == 0)
    {
      return i;
    }
  }
  return 0;
}

/* Get identifiers and reserved words */
TOKEN identifier(TOKEN tok)
{
  int c;
  int size = 0;
  char word[16];
  int val = 0;
  //First character of an identifier has to be Alpha
  if ((c = peekchar()) != EOF && CHARCLASS[c] == ALPHA)
  {
    c = getchar();
    word[size] = c;
    size += 1;
    while ((c = peekchar()) != EOF && (CHARCLASS[c] == ALPHA || CHARCLASS[c] == NUMERIC))
    {
      c = getchar();
      if (size < 15)
      {
        word[size] = c;
        size += 1;
      }
    }
    word[size] = '\0';

    if ((val = findReservedWords(word)) != 0)
    {
      tok->tokentype = RESERVED;
      tok->whichval = val;
      return tok;
    }
    else if ((val = findOperator(word)) != 0)
    {
      tok->tokentype = OPERATOR;
      tok->whichval = val;
      return tok;
    }
    else
    {
      tok->tokentype = IDENTIFIERTOK;
      strcpy(tok->stringval, word);
    }
  }
  return tok;
}

TOKEN getstring(TOKEN tok)
{
  getchar();
  int c = 0;
  int c2 = 0;
  int size = 0;
  char word[16];
  while ((c = peekchar()) != EOF && !(c == '\n' || c == '\t'))
  {
    c = getchar();
    if (c == '\'')
    {
      if (!((c2 = peekchar()) != EOF && c2 != '\''))
      {
        getchar();
      }
      else
      {
        break;
      }
    }
    if (size < 15)
    {
      word[size] = c;
      size++;
    }
  }

  if (size >= 16)
    word[15] = '\0';
  else
    word[size] = '\0';

  tok->tokentype = STRINGTOK;
  strcpy(tok->stringval, word);
  return tok;
}

TOKEN special(TOKEN tok)
{
  int c1;
  int c2;
  int val = 0;
  char str[3];

  str[0] = 0;
  if ((c1 = peekchar()) != EOF)
  {
    if (!((c2 = peek2char()) != EOF && CHARCLASS[c2] == SPECIAL))
    {
      str[0] = c1;
      str[1] = 0;
      getchar();
    }
    else
    {
      str[0] = c1;
      str[1] = c2;
      str[2] = 0;
      if (findOperator(str) != 0 || findDelimiter(str) != 0)
      {
        for (int i = 0; i < 2; i++)
        {
          getchar();
        }
      }
      else
      {
        getchar();
        str[1] = 0;
      }
    }
  }
  if ((val = findOperator(str)) != 0)
  {
    tok->tokentype = OPERATOR;
    tok->whichval = val;
    return tok;
  }
  else if ((val = findDelimiter(str)) != 0)
  {
    tok->tokentype = DELIMITER;
    tok->whichval = val;
    return tok;
  }
  else
  {
    fprintf(stderr, "Invalid Token %s\n", str);
  }
  return tok;
}

/* Get and convert unsigned numbers of all types. */
TOKEN number(TOKEN tok)
{
  long num;
  int c, i, charval;
  num = 0;
  int realBool = 0;
  int power = 0;
  int length = 0;
  int mult_power = 0;
  double mult = 1;
  while ((c = peekchar()) != EOF && CHARCLASS[c] == NUMERIC)
  {
    c = getchar();
    charval = (c - '0');
    if (charval == 0 && num == 0)
      realBool = 0;
    else
    {
      if (length < 11)
      {
        num = num * 10 + charval;
        length++;
      }
      else
        power++;
    }
  }
  if ((c = peekchar()) == '.' && CHARCLASS[peek2char()] == NUMERIC)
  {
    realBool = 1;
    getchar();
    while ((c = peekchar()) != EOF && CHARCLASS[c] == NUMERIC)
    {
      c = getchar();
      charval = (c - '0');
      if (charval == 0 && num == 0)
        power -= 1;
      else if (length < 8)
      {
        num = num * 10 + charval;
        length += 1;
        power -= 1;
      }
    }
  }

  if ((c = peekchar()) == 'e' || (c = peekchar()) == 'E')
  {
    if ((c = peek2char()) == '+' || CHARCLASS[peek2char()] == NUMERIC)
    {
      realBool = 1;
      getchar();
      if ((c = peekchar()) == '+')
        getchar();

      while ((c = peekchar() != EOF) && CHARCLASS[peekchar()] == NUMERIC)
      {
        c = getchar();
        charval = (c - '0');
        mult_power = mult_power * 10 + charval;
      }
    }
  }

  if (((c = peekchar()) == 'e' || (c = peekchar()) == 'E'))
  {
    if ((c = peek2char()) == '-')
    {
      getchar();
      getchar();
      realBool = 1;

      while ((c = peekchar() != EOF) && CHARCLASS[peekchar()] == NUMERIC)
      {
        c = getchar();
        charval = (c - '0');
        mult_power = mult_power * 10 + charval;
      }
      mult_power *= -1;
    }
  }

  if (mult_power + power + length - 1 > 38 || mult_power + power + length - 1 < -38)
  {
    mult_power = 0;
    power = -404;
  }

  if (realBool == 0)
  {
    if (num > 2147483647 || length > 10)
      printf("%s\n", "out of range");
    tok->basicdt = INTEGER;
    tok->tokentype = NUMBERTOK;
    tok->intval = num;
  }
  else
  {
    power += mult_power;
    if (power == -404)
      printf("%s\n", "out of range");
    if (power < 0)
    {
      for (i = power; i < 0; i++)
        mult *= 10;
      tok->basicdt = REAL;
      tok->tokentype = NUMBERTOK;
      tok->realval = num / mult;
    }
    else if (power > 0)
    {
      for (i = power; i > 0; i--)
        mult *= 10;
      tok->basicdt = REAL;
      tok->tokentype = NUMBERTOK;
      tok->realval = num * mult;
    }
  }
  return (tok);
}
