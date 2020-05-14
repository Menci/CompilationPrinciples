%{
#include <cerrno>
#include <climits>
#include <cstdlib>
#include <cstring>
#include <string>

#include "context.h"
#include "parser.hh"

%}

%option caseless noyywrap nounput noinput batch debug

Empty                    [ \t\r\a]+

Digit                    [0-9]
Alpha                    [a-z]

IdentifierFirstChar      {Alpha}|_
IdentifierFollowingChar  {IdentifierFirstChar}|{Digit}
Identifier               {IdentifierFirstChar}{IdentifierFollowingChar}*

IntegerPart              {Digit}+
ExponentPart             e(\+|\-)?{Digit}+
FractionPart             {Digit}+
Number                   {IntegerPart}(\.({ExponentPart}|{FractionPart}{ExponentPart}?))?|\.{FractionPart}{ExponentPart}?

String                   '(''|[^'])*'

%{
// Code run each time a pattern is matched.
#define YY_USER_ACTION ctx.location.columns(yyleng);
%}

%%

{Empty}      ctx.location.step();
\n+          ctx.location.lines(yyleng); ctx.location.step();

=            return yy::parser::make_O_EQ        (ctx.location);
:=           return yy::parser::make_O_ASSIGN    (ctx.location);
\<>          return yy::parser::make_O_NE        (ctx.location);
\<           return yy::parser::make_O_LT        (ctx.location);
>            return yy::parser::make_O_GT        (ctx.location);
\<=          return yy::parser::make_O_LE        (ctx.location);
>=           return yy::parser::make_O_GE        (ctx.location);
\+           return yy::parser::make_O_PLUS      (ctx.location);
-            return yy::parser::make_O_MINUS     (ctx.location);
\*           return yy::parser::make_O_TIMES     (ctx.location);
!            return yy::parser::make_O_NOT       (ctx.location);
and          return yy::parser::make_O_AND       (ctx.location);
or           return yy::parser::make_O_OR        (ctx.location);
xor          return yy::parser::make_O_XOR       (ctx.location);
shl          return yy::parser::make_O_SHL       (ctx.location);
shr          return yy::parser::make_O_SHR       (ctx.location);
\/           return yy::parser::make_O_SLASH     (ctx.location);
div          return yy::parser::make_O_DIV       (ctx.location);
mod          return yy::parser::make_O_MOD       (ctx.location);
\^           return yy::parser::make_O_POINTER   (ctx.location);
@            return yy::parser::make_O_AT        (ctx.location);

;            return yy::parser::make_D_SEMICON   (ctx.location);
,            return yy::parser::make_D_COMMA     (ctx.location);
:            return yy::parser::make_D_COLON     (ctx.location);
\.\.         return yy::parser::make_D_DOTDOT    (ctx.location);
\.           return yy::parser::make_D_DOT       (ctx.location);
\(           return yy::parser::make_D_LPAREN    (ctx.location);
\)           return yy::parser::make_D_RPAREN    (ctx.location);
\[           return yy::parser::make_D_LSQUARE   (ctx.location);
\]           return yy::parser::make_D_RSQUARE   (ctx.location);

array        return yy::parser::make_K_ARRAY     (ctx.location);
begin        return yy::parser::make_K_BEGIN     (ctx.location);
const        return yy::parser::make_K_CONST     (ctx.location);
do           return yy::parser::make_K_DO        (ctx.location);
downto       return yy::parser::make_K_DOWNTO    (ctx.location);
else         return yy::parser::make_K_ELSE      (ctx.location);
end          return yy::parser::make_K_END       (ctx.location);
for          return yy::parser::make_K_FOR       (ctx.location);
function     return yy::parser::make_K_FUNCTION  (ctx.location);
if           return yy::parser::make_K_IF        (ctx.location);
nil          return yy::parser::make_K_NIL       (ctx.location);
of           return yy::parser::make_K_OF        (ctx.location);
procedure    return yy::parser::make_K_PROCEDURE (ctx.location);
program      return yy::parser::make_K_PROGRAM   (ctx.location);
record       return yy::parser::make_K_RECORD    (ctx.location);
repeat       return yy::parser::make_K_REPEAT    (ctx.location);
then         return yy::parser::make_K_THEN      (ctx.location);
to           return yy::parser::make_K_TO        (ctx.location);
type         return yy::parser::make_K_TYPE      (ctx.location);
until        return yy::parser::make_K_UNTIL     (ctx.location);
var          return yy::parser::make_K_VAR       (ctx.location);
while        return yy::parser::make_K_WHILE     (ctx.location);
call         return yy::parser::make_K_CALL      (ctx.location);

{Number}     return yy::parser::make_T_NUMBER    (yytext, ctx.location);
{String}     return yy::parser::make_T_STRING    (yytext, ctx.location);
{Identifier} return yy::parser::make_T_IDENTIFIER(yytext, ctx.location);

<<EOF>>      return yy::parser::make_EOF         (ctx.location);

.            throw yy::parser::syntax_error(ctx.location, "Invalid character: " + std::string(yytext));

%%

void Context::initializeScanner() {
  yy_flex_debug = traceScanning;
  if (file.empty() || file == "-")
    yyin = stdin;
  else if (!(yyin = fopen(file.c_str(), "r"))) {
    std::cerr << "cannot open " << file << ": " << strerror(errno) << '\n';
    exit(EXIT_FAILURE);
  }
}
