ELF          >                    H          @     @ 
  UH��H���<%     �'   � �    H�E��<%     �	   H�}��    �����H��]�ffff.�     UH��H��� �    � �    H�        � �    �E�����1�H��]�Started scanner test.
  clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)           zR x�            C    A�C      8       7    A�C                           {    ��                                                            �    ��              �    ��              L                                            0                      <     P       7       e                      A                      $             C                                         ��������$                     4             ��������[             ��������b             ��������h                     s          
   ��������                      <             P        .rela.text .comment init_charclass testscanner initscanner main printtoken gettoken .note.GNU-stack printf .rela.eh_frame lexandr.c .strtab .symtab CHARCLASS EOFFLG .rodata.str1.1                                                                    �                      �      �                                                   @       �                                                    �      �       	                    �      2               �                                          0               �       7                             U                                                           q     p                     P                              l                      `      0       	                    �                      h      8                                   "function", "goto", "if", "label", "nil",
                          "of", "packed", "procedure", "program", "record",
                          "repeat", "set", "then", "to", "type",
                          "until", "var", "while", "with"};

TOKEN talloc() /* allocate a new token record */
{
  TOKEN tok;
  tok = (TOKEN)calloc(1, sizeof(struct tokn));
  if (tok != NULL)
  {
    tok->tokentype = 9999;
    tok->datatype = 9999;
    /*
         * In this way, the initial value of the union becomes
         *
         * string: ################
         * int/which: 589505315
         * real:   0.00000
         *
         * The point of doing so is that now the string
         * does not have any '\0' initially. Therefore,
         * if '\0' is not explicitly placed in the string.
         * the string won't stop when being printed.
         */
    for (int i = 0; i < 16; i++)
      tok->stringval[i] = 35;
    return (tok);
  }
  else
  {
    printf("talloc failed.");
    return 0;
  }
}

void printtoken(TOKEN tok)
{
  switch (tok->tokentype)
  {
  case OPERATOR:
    printf("tokentype: %2d  which: %4d   %10s\n",
           tok->tokentype, tok->whichval,
           opprnt[tok->whichval]);
    break;
  case DELIMITER:
    printf("tokentype: %2d  which: %4d   %10s\n",
           tok->tokentype, tok->whichval,
           delprnt[tok->whichval]);
    break;
  case RESERVED:
    printf("tokentype: %2d  which: %4d   %10s\n",
           tok->tokentype, tok->whichval,
           resprnt[tok->whichval]);
    break;
  case IDENTIFIERTOK:
  case STRINGTOK:
    printf("tokentype: %2d  value:  %16s\n",
           tok->tokentype, tok->stringval);
    break;
  case NUMBERTOK:
    switch (tok->datatype)
    {
    case INTEGER:
      printf("tokentype: %2d  type:  %4d %12d\n",
             tok->tokentype, tok->datatype, tok->intval);
      break;
    case REAL:
      printf("tokentype: %2d  type:  %4d %12e\n",
             tok->tokentype, tok->datatype, tok->realval);
      break;
    }
  }
}
