%skeleton "lalr1.cc"
%require "3.5.2"
%defines

%define api.token.constructor
%define api.value.type variant
%define parse.assert

%code requires {
#include "ast.h"
#include "util.h"
#include <string>
class Context;
}

// The parsing context.
%param { Context &ctx }

%locations

%define parse.trace
%define parse.error verbose

%code {
#include "context.h"
}

%define api.token.prefix {TOK_}

%token O_EQ O_ASSIGN O_NE O_LT O_GT O_LE O_GE O_PLUS O_MINUS O_TIMES O_NOT O_AND O_OR O_XOR O_SHL O_SHR O_SLASH O_DIV O_MOD O_POINTER O_AT

%token D_SEMICON D_COMMA D_COLON D_DOTDOT D_DOT D_LPAREN D_RPAREN D_LSQUARE D_RSQUARE

%token K_ARRAY K_BEGIN K_CONST K_DO K_DOWNTO K_ELSE K_END K_FOR K_FUNCTION K_GOTO K_IF K_NIL K_OF K_PROCEDURE K_PROGRAM K_RECORD K_REPEAT K_THEN K_TO K_TYPE K_UNTIL K_VAR K_WHILE K_CALL

%token <std::string> T_NUMBER T_STRING T_IDENTIFIER    

// https://stackoverflow.com/questions/43691665/make-bison-accept-an-alternative-eof-token
%token EOF 0

// %printer { yyo << $$; } <*>;

%%
%start Program;
%type <std::shared_ptr<Program>> Program;
Program
  : K_PROGRAM
    T_IDENTIFIER
    D_SEMICON
    Block
    D_DOT
    { ctx.program = std::make_shared<Program>($2, $4); }
  | Block
    D_DOT
    { ctx.program = std::make_shared<Program>("(unnamed)", $1); }

%type <std::shared_ptr<Block>> Block;
Block
  : { ctx.blockStack.push(ctx.currentBlock); ctx.currentBlock = std::make_shared<Block>(ctx.currentBlock); }
    DeclarationSection
    StatementSection
    { $$ = ctx.currentBlock; if (!ctx.blockStack.empty()) { ctx.currentBlock = ctx.blockStack.top(); ctx.blockStack.pop(); } }

DeclarationSection
  : ConstantDefinitionSection
    TypeDefinitionSection
    VariableDefinitionSection
    CallableDefinitionSection

ConstantDefinitionSection
  :
  | K_CONST
    ConstantDefinition
ConstantDefinition
  : T_IDENTIFIER
    O_EQ
    ConstantValue
    D_SEMICON
    { ctx.currentBlock->constants.push_back(std::make_shared<Constant>($1, $3)); }
    ConstantDefinitionTail
ConstantDefinitionTail
  :
  | ConstantDefinition
%type <std::string> ConstantValue;
ConstantValue
  : T_IDENTIFIER
    { $$ = $1; }
  | Sign T_NUMBER
    { $$ = $1 + $2; }
  | T_STRING
    { $$ = $1; }

%type <std::string> Sign;
Sign
  : { $$ = ""; }
  | O_PLUS
    { $$ = "+"; }
  | O_MINUS
    { $$ = "-"; }

TypeDefinitionSection
  :
  | K_TYPE
    TypeDefinition
TypeDefinition
  : T_IDENTIFIER
    O_EQ
    Type
    D_SEMICON
    TypeDefinitionTail
TypeDefinitionTail
  :
  | TypeDefinition
%type <std::shared_ptr<Type>> Type;
Type
  : RecordType
    { $$ = $1; }
  | PointerType
    { $$ = $1; }
  | ArraySchema
    { $$ = $1; }
  | T_IDENTIFIER
    { $$ = std::make_shared<TypeIdentifier>($1); }

%type <std::shared_ptr<RecordType>> RecordType;
RecordType
  : K_RECORD
    RecordFieldList
    K_END
    { $$ = std::make_shared<RecordType>(std::move($2)); }
%type <std::vector<std::shared_ptr<Variable>>> RecordFieldList;
RecordFieldList
  : IdentifierList
    D_COLON
    TypeInDeclaration
    D_SEMICON
    RecordFieldListTail
    { $$ = merge(map($1, [&] (auto x) { return std::make_shared<Variable>(x, $3); }), $5); }
%type <std::vector<std::shared_ptr<Variable>>> RecordFieldListTail;
RecordFieldListTail
  : { $$ = {}; }
  | RecordFieldList
    { $$ = $1; }

VariableDefinitionSection
  :
  | K_VAR
    VariableDefinition
VariableDefinition
  : IdentifierList
    D_COLON
    TypeInDeclaration
    D_SEMICON
    VariableDefinitionTail
    { for (auto &x : $1) ctx.currentBlock->variables.push_back(std::make_shared<Variable>(x, $3)); }
  | IdentifierList
    D_SEMICON
    VariableDefinitionTail
VariableDefinitionTail
  :
  | VariableDefinition

%type <std::vector<std::string>> IdentifierList;
IdentifierList
  : T_IDENTIFIER
    IdentifierListTail
    { $$ = concat($1, $2); }
%type <std::vector<std::string>> IdentifierListTail;
IdentifierListTail
  : { $$ = {}; }
  | D_COMMA
    IdentifierList
    { $$ = $2; }

%type <std::shared_ptr<TypeInDeclaration>> TypeInDeclaration;
TypeInDeclaration
  : T_IDENTIFIER
    { $$ = std::make_shared<TypeIdentifier>($1); }
  | ArraySchema
    { $$ = $1; }
%type <std::shared_ptr<ArraySchema>> ArraySchema;
ArraySchema
  : K_ARRAY
    D_LSQUARE
    ArrayBound
    D_RSQUARE
    ArrayElementType
    { $$ = std::make_shared<ArraySchema>(std::move($3)); }
ArrayElementType
  :
  | K_OF
    T_IDENTIFIER
%type <std::vector<std::shared_ptr<ArrayDimensionalBound>>> ArrayBound;
ArrayBound
  : ArrayDimensionalBound
    ArrayBoundTail
    { $$ = concat($1, $2); }
%type <std::vector<std::shared_ptr<ArrayDimensionalBound>>> ArrayBoundTail;
ArrayBoundTail
  : { $$ = {}; }
  | D_COMMA
    ArrayBound
    { $$ = $2; }
%type <std::shared_ptr<ArrayDimensionalBound>> ArrayDimensionalBound;
ArrayDimensionalBound
  : ConstantValue
    D_DOTDOT
    ConstantValue
    { $$ = std::make_shared<ArrayDimensionalBound>($1, $3); }

%type <std::shared_ptr<PointerType>> PointerType;
PointerType
  : O_POINTER
    TypeInDeclaration
    { $$ = std::make_shared<PointerType>($2); }

CallableDefinitionSection
  :
  | CallableDefinition
CallableDefinition
  : ProcedureHeading
    D_SEMICON
    Block
    D_SEMICON
    { ctx.currentBlock->callables.push_back(std::make_shared<Callable>(std::get<0>($1), std::move(std::get<1>($1)), std::get<2>($1), $3)); }
    CallableDefinitionTail
  | FunctionHeading
    D_SEMICON
    Block
    D_SEMICON
    { ctx.currentBlock->callables.push_back(std::make_shared<Callable>(std::get<0>($1), std::move(std::get<1>($1)), std::get<2>($1), $3)); }
    CallableDefinitionTail
CallableDefinitionTail
  :
  | CallableDefinition

%type <std::tuple<std::string, std::vector<std::shared_ptr<Variable>>, std::string>> ProcedureHeading;
ProcedureHeading
  : K_PROCEDURE
    T_IDENTIFIER
    D_LPAREN
    ParameterList
    D_RPAREN
    { $$ = std::tuple<std::string, std::vector<std::shared_ptr<Variable>>, std::string>($2, $4, ""); }
  | K_PROCEDURE
    T_IDENTIFIER
    { $$ = std::tuple<std::string, std::vector<std::shared_ptr<Variable>>, std::string>($2, {}, ""); }
%type <std::tuple<std::string, std::vector<std::shared_ptr<Variable>>, std::string>> FunctionHeading;
FunctionHeading
  : K_FUNCTION
    T_IDENTIFIER
    D_LPAREN
    ParameterList
    D_RPAREN
    D_COLON
    T_IDENTIFIER
    { $$ = std::tuple<std::string, std::vector<std::shared_ptr<Variable>>, std::string>($2, $4, $7); }
  | K_FUNCTION
    T_IDENTIFIER
    D_COLON
    T_IDENTIFIER
    { $$ = std::tuple<std::string, std::vector<std::shared_ptr<Variable>>, std::string>($2, {}, $4); }

%type <std::vector<std::shared_ptr<Variable>>> ParameterList;
ParameterList
  : ParameterListItem
    ParameterListTail
    { $$ = merge($1, $2); }
%type <std::vector<std::shared_ptr<Variable>>> ParameterListTail;
ParameterListTail
  : { $$ = {}; }
  | D_SEMICON
    ParameterList
    { $$ = $2; }
%type <std::vector<std::shared_ptr<Variable>>> ParameterListItem;
ParameterListItem
  : IdentifierList
    D_COLON
    TypeInDeclaration
    { $$ = map($1, [&] (auto x) { return std::make_shared<Variable>(x, $3); }); }

%type <std::shared_ptr<CompoundStatement>> StatementSection;
StatementSection
  : CompoundStatement
    { ctx.currentBlock->statement = $1; }

%type <std::shared_ptr<Statement>> Statement;
Statement
  : { $$ = std::make_shared<EmptyStatement>(); }
  | AssignmentStatement
    { $$ = $1; }
  | ExplicitCallStatement
    { $$ = $1; }
  | CompoundStatement
    { $$ = $1; }
  | WhileStatement
    { $$ = $1; }
  | RepeatStatement
    { $$ = $1; }
  | ForStatement
    { $$ = $1; }
  | IfStatement
    { $$ = $1; }
  | Expression
    { $$ = std::make_shared<ExpressionStatement>($1); }

%type <std::shared_ptr<AssignmentStatement>> AssignmentStatement;
AssignmentStatement
  : MaybeLeftValueExpression
    O_ASSIGN
    Expression
    { $$ = std::make_shared<AssignmentStatement>($1, $3); }

%type <std::shared_ptr<ExplicitCallStatement>> ExplicitCallStatement;
ExplicitCallStatement
  : K_CALL
    T_IDENTIFIER
    { $$ = std::make_shared<ExplicitCallStatement>($2); }

%type <std::shared_ptr<CompoundStatement>> CompoundStatement;
CompoundStatement
  : K_BEGIN
    StatementSequence
    K_END
    { $$ = std::make_shared<CompoundStatement>($2); }
%type <std::vector<std::shared_ptr<Statement>>> StatementSequence;
StatementSequence
  : Statement
    StatementSequenceTail
    { $$ = concat($1, $2); }
%type <std::vector<std::shared_ptr<Statement>>> StatementSequenceTail;
StatementSequenceTail
  : { $$ = {}; }
  | D_SEMICON
    StatementSequence
    { $$ = $2; }

%type <std::shared_ptr<WhileStatement>> WhileStatement;
WhileStatement
  : K_WHILE
    Expression
    K_DO
    Statement
    { $$ = std::make_shared<WhileStatement>($2, $4); }

%type <std::shared_ptr<RepeatStatement>> RepeatStatement;
RepeatStatement
  : K_REPEAT
    StatementSequence
    K_UNTIL
    Expression
    { $$ = std::make_shared<RepeatStatement>($4, std::make_shared<CompoundStatement>($2)); }

%type <std::shared_ptr<ForStatement>> ForStatement;
ForStatement
  : K_FOR
    T_IDENTIFIER
    O_ASSIGN
    Expression
    ForDirection
    Expression
    K_DO
    Statement
    { $$ = std::make_shared<ForStatement>($2, $4, $5, $6, $8); }
%type <ForStatement::Direction> ForDirection;
ForDirection
  : K_TO
    { $$ = ForStatement::Direction::Up; }
  | K_DOWNTO
    { $$ = ForStatement::Direction::Down; }

%nonassoc K_THEN;
%nonassoc K_ELSE;
%type <std::shared_ptr<IfStatement>> IfStatement;
IfStatement
  : K_IF
    Expression
    K_THEN
    Statement
    K_ELSE
    Statement
    { $$ = std::make_shared<IfStatement>($2, $4, $6); }
  | K_IF
    Expression
    K_THEN
    Statement
    { $$ = std::make_shared<IfStatement>($2, $4, std::make_shared<EmptyStatement>()); }

%type <std::shared_ptr<MaybeLeftValueExpression>> MaybeLeftValueExpression;
MaybeLeftValueExpression
  : T_IDENTIFIER
    { $$ = std::make_shared<IdentifierExpression>($1); }
  | RecordAccessExpression
    { $$ = $1; }
  | ArrayAccessExpression
    { $$ = $1; }
  | PointerAccessExpression
    { $$ = $1; }
%type <std::shared_ptr<RecordAccessExpression>> RecordAccessExpression;
RecordAccessExpression
  : MaybeLeftValueExpression
    D_DOT
    T_IDENTIFIER
    { $$ = std::make_shared<RecordAccessExpression>($1, $3); }
%type <std::shared_ptr<ArrayAccessExpression>> ArrayAccessExpression;
ArrayAccessExpression
  : MaybeLeftValueExpression
    D_LSQUARE
    ExpressionList
    D_RSQUARE
    { $$ = std::make_shared<ArrayAccessExpression>($1, $3); }
%type <std::vector<std::shared_ptr<Expression>>> ExpressionList;
ExpressionList
  : Expression
    ExpressionListTail
    { $$ = concat($1, $2); }
%type <std::vector<std::shared_ptr<Expression>>> ExpressionListTail;
ExpressionListTail
  : { $$ = {}; }
  | D_COMMA
    ExpressionList
    { $$ = $2; }
%type <std::shared_ptr<PointerAccessExpression>> PointerAccessExpression;
PointerAccessExpression
  : MaybeLeftValueExpression
    O_POINTER
    { $$ = std::make_shared<PointerAccessExpression>($1); }
  | CallExpressionWithArguments
    O_POINTER
    { $$ = std::make_shared<PointerAccessExpression>($1); }

%type <std::shared_ptr<Expression>> Expression;
Expression
  : OperatorExpression
    { $$ = $1; }
%type <std::shared_ptr<Expression>> NonOperatorExpression;
NonOperatorExpression
  : MaybeLeftValueExpression
    { $$ = $1; }
  | CallExpressionWithArguments
    { $$ = $1; }
  | Sign T_NUMBER
    { $$ = std::make_shared<ConstantExpression>($1 + $2); }
  | T_STRING
    { $$ = std::make_shared<ConstantExpression>($1); }

%left O_EQ O_NE O_LT O_GT O_LE O_GE;
%left O_PLUS O_MINUS O_OR O_XOR;
%left O_TIMES O_SLASH O_DIV O_MOD O_AND O_SHL O_SHR;
%type <std::shared_ptr<Expression>> OperatorExpression;
OperatorExpression
  : UnaryOperatorExpression
    { $$ = $1; }
  | OperatorExpression O_EQ    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Equal, $3); }
  | OperatorExpression O_NE    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::NotEqual, $3); }
  | OperatorExpression O_LT    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::LessThan, $3); }
  | OperatorExpression O_GT    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::GreaterThan, $3); }
  | OperatorExpression O_LE    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::LessThanOrEqual, $3); }
  | OperatorExpression O_GE    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::GreaterThanOrEqual, $3); }
  | OperatorExpression O_PLUS  OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Plus, $3); }
  | OperatorExpression O_MINUS OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Minus, $3); }
  | OperatorExpression O_OR    OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Or, $3); }
  | OperatorExpression O_XOR   OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Xor, $3); }
  | OperatorExpression O_TIMES OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Times, $3); }
  | OperatorExpression O_SLASH OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Slash, $3); }
  | OperatorExpression O_DIV   OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Div, $3); }
  | OperatorExpression O_MOD   OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::Mod, $3); }
  | OperatorExpression O_AND   OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::And, $3); }
  | OperatorExpression O_SHL   OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::LeftShift, $3); }
  | OperatorExpression O_SHR   OperatorExpression
    { $$ = std::make_shared<BinaryOperatorExpression>($1, BinaryOperator::RightShift, $3); }
%type <std::shared_ptr<Expression>> UnaryOperatorExpression;
UnaryOperatorExpression
  :         NonOperatorExpression
    { $$ = $1; }
  |         ParenthesesExpression
    { $$ = $1; }
  | O_NOT   UnaryOperatorExpression
    { $$ = std::make_shared<UnaryOperatorExpression>(UnaryOperator::Not, $2); }
  | O_PLUS  UnaryOperatorExpression
    { $$ = std::make_shared<UnaryOperatorExpression>(UnaryOperator::Plus, $2); }
  | O_MINUS UnaryOperatorExpression
    { $$ = std::make_shared<UnaryOperatorExpression>(UnaryOperator::Minus, $2); }
  | O_AT    UnaryOperatorExpression
    { $$ = std::make_shared<UnaryOperatorExpression>(UnaryOperator::At, $2); }
%type <std::shared_ptr<Expression>> ParenthesesExpression;
ParenthesesExpression
  : D_LPAREN Expression D_RPAREN
    { $$ = $2; }

%type <std::shared_ptr<CallExpressionWithArguments>> CallExpressionWithArguments;
CallExpressionWithArguments
  : T_IDENTIFIER
    CallArgumentList
    { $$ = std::make_shared<CallExpressionWithArguments>($1, $2); }
%type <std::vector<std::shared_ptr<Expression>>> CallArgumentList;
CallArgumentList
  : D_LPAREN
    CallArgumentListContent
    D_RPAREN
    { $$ = $2; }
  | D_LPAREN
    D_RPAREN
    { $$ = {}; }
%type <std::vector<std::shared_ptr<Expression>>> CallArgumentListContent;
CallArgumentListContent
  : Expression
    CallArgumentListContentTail
    { $$ = concat($1, $2); }
%type <std::vector<std::shared_ptr<Expression>>> CallArgumentListContentTail;
CallArgumentListContentTail
  : { $$ = {}; }
  | D_COMMA
    CallArgumentListContent
    { $$ = $2; }
%%

void yy::parser::error(const location_type &location, const std::string &message) { std::cerr << location << ": " << message << std::endl; }
