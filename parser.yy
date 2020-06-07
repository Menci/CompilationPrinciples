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

%%
%start Program;
%type <std::shared_ptr<AST::Program>> Program;
Program
  : K_PROGRAM
    T_IDENTIFIER
    D_SEMICON
    Block
    D_DOT
    { ctx.program = std::make_shared<AST::Program>($2, $4);  
      if (ctx.printReduceRule) std::cerr << "Program => K_PROGRAM T_IDENTIFIER D_SEMICON Block D_DOT" << std::endl; }
  | Block
    D_DOT
    { ctx.program = std::make_shared<AST::Program>("(unnamed)", $1);  
      if (ctx.printReduceRule) std::cerr << "Program => Block D_DOT" << std::endl; }

%type <std::shared_ptr<AST::Block>> Block;
Block
  : { ctx.blockStack.push(ctx.currentBlock); ctx.currentBlock = std::make_shared<AST::Block>(ctx.currentBlock); }
    DeclarationSection
    StatementSection
    { if (ctx.printReduceRule) std::cerr << "Block => DeclarationSection StatementSection" << std::endl;  
      $$ = ctx.currentBlock; if (!ctx.blockStack.empty()) { ctx.currentBlock = ctx.blockStack.top(); ctx.blockStack.pop(); } }

DeclarationSection
  : ConstantDefinitionSection
    TypeDefinitionSection
    VariableDefinitionSection
    CallableDefinitionSection
    { if (ctx.printReduceRule) std::cerr << "DeclarationSection => ConstantDefinitionSection TypeDefinitionSection VariableDefinitionSection CallableDefinitionSection" << std::endl; }

ConstantDefinitionSection
  :
    { if (ctx.printReduceRule) std::cerr << "ConstantDefinitionSection => " << std::endl; }
  | K_CONST
    ConstantDefinition
    { if (ctx.printReduceRule) std::cerr << "ConstantDefinitionSection => K_CONST ConstantDefinition" << std::endl; }
ConstantDefinition
  : T_IDENTIFIER
    O_EQ
    ConstantValue
    D_SEMICON
    { ctx.currentBlock->constants.push_back(std::make_shared<AST::Constant>($1, $3)); }
    ConstantDefinitionTail
    { if (ctx.printReduceRule) std::cerr << "ConstantDefinition => T_IDENTIFIER O_EQ ConstantValue D_SEMICON ConstantDefinitionTail" << std::endl; }
ConstantDefinitionTail
  :
    { if (ctx.printReduceRule) std::cerr << "ConstantDefinitionTail => " << std::endl; }
  | ConstantDefinition
    { if (ctx.printReduceRule) std::cerr << "ConstantDefinitionTail => ConstantDefinition" << std::endl; }
%type <std::string> ConstantValue;
ConstantValue
  : T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "ConstantValue => T_IDENTIFIER" << std::endl;  
      $$ = $1; }
  | Sign T_NUMBER
    { if (ctx.printReduceRule) std::cerr << "ConstantValue => Sign T_NUMBER" << std::endl;  
      $$ = $1 + $2; }
  | T_STRING
    { if (ctx.printReduceRule) std::cerr << "ConstantValue => T_STRING" << std::endl;  
      $$ = $1; }

%type <std::string> Sign;
Sign
  : { if (ctx.printReduceRule) std::cerr << "Sign => " << std::endl;  
      $$ = ""; }
  | O_PLUS
    { if (ctx.printReduceRule) std::cerr << "Sign => O_PLUS" << std::endl;  
      $$ = "+"; }
  | O_MINUS
    { if (ctx.printReduceRule) std::cerr << "Sign => O_MINUS" << std::endl;  
      $$ = "-"; }

TypeDefinitionSection
  :
    { if (ctx.printReduceRule) std::cerr << "TypeDefinitionSection => " << std::endl; }
  | K_TYPE
    TypeDefinition
    { if (ctx.printReduceRule) std::cerr << "TypeDefinitionSection => K_TYPE TypeDefinition" << std::endl; }
TypeDefinition
  : T_IDENTIFIER
    O_EQ
    Type
    D_SEMICON
    { ctx.currentBlock->typeAliases.push_back(std::make_shared<AST::TypeAlias>($1, $3)); }
    TypeDefinitionTail
    { if (ctx.printReduceRule) std::cerr << "TypeDefinition => T_IDENTIFIER O_EQ Type D_SEMICON TypeDefinitionTail" << std::endl; }
TypeDefinitionTail
  :
    { if (ctx.printReduceRule) std::cerr << "TypeDefinitionTail => " << std::endl; }
  | TypeDefinition
    { if (ctx.printReduceRule) std::cerr << "TypeDefinitionTail => TypeDefinition" << std::endl; }
%type <std::shared_ptr<AST::Type>> Type;
Type
  : RecordType
    { if (ctx.printReduceRule) std::cerr << "Type => RecordType" << std::endl;  
      $$ = $1; }
  | PointerType
    { if (ctx.printReduceRule) std::cerr << "Type => PointerType" << std::endl;  
      $$ = $1; }
  | ArraySchema
    { if (ctx.printReduceRule) std::cerr << "Type => ArraySchema" << std::endl;  
      $$ = $1; }
  | T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "Type => T_IDENTIFIER" << std::endl;  
      $$ = std::make_shared<AST::TypeIdentifier>($1); }

%type <std::shared_ptr<AST::RecordType>> RecordType;
RecordType
  : K_RECORD
    RecordFieldList
    K_END
    { if (ctx.printReduceRule) std::cerr << "RecordType => K_RECORD RecordFieldList K_END" << std::endl;  
      $$ = std::make_shared<AST::RecordType>(std::move($2)); }
%type <std::list<std::shared_ptr<AST::Variable>>> RecordFieldList;
RecordFieldList
  : IdentifierList
    D_COLON
    TypeInDeclaration
    D_SEMICON
    RecordFieldListTail
    { if (ctx.printReduceRule) std::cerr << "RecordFieldList => IdentifierList D_COLON TypeInDeclaration D_SEMICON RecordFieldListTail" << std::endl;  
      $$ = merge(map($1, [&] (auto x) { return std::make_shared<AST::Variable>(x, $3); }), $5); }
%type <std::list<std::shared_ptr<AST::Variable>>> RecordFieldListTail;
RecordFieldListTail
  : { if (ctx.printReduceRule) std::cerr << "RecordFieldListTail => " << std::endl;  
      $$ = {}; }
  | RecordFieldList
    { if (ctx.printReduceRule) std::cerr << "RecordFieldListTail => RecordFieldList" << std::endl;  
      $$ = $1; }

VariableDefinitionSection
  :
    { if (ctx.printReduceRule) std::cerr << "VariableDefinitionSection => " << std::endl; }
  | K_VAR
    VariableDefinition
    { if (ctx.printReduceRule) std::cerr << "VariableDefinitionSection => K_VAR VariableDefinition" << std::endl; }
VariableDefinition
  : IdentifierList
    D_COLON
    TypeInDeclaration
    D_SEMICON
    { for (auto &x : $1) ctx.currentBlock->variables.push_back(std::make_shared<AST::Variable>(x, $3)); }
    VariableDefinitionTail
    { if (ctx.printReduceRule) std::cerr << "VariableDefinition => IdentifierList D_COLON TypeInDeclaration D_SEMICON VariableDefinitionTail" << std::endl; }
  | IdentifierList
    D_SEMICON
    { for (auto &x : $1) ctx.currentBlock->variables.push_back(std::make_shared<AST::Variable>(x, std::make_shared<AST::TypeIdentifier>("integer"))); }
    VariableDefinitionTail
    { if (ctx.printReduceRule) std::cerr << "VariableDefinition => IdentifierList D_SEMICON VariableDefinitionTail" << std::endl; }
VariableDefinitionTail
  :
    { if (ctx.printReduceRule) std::cerr << "VariableDefinitionTail => " << std::endl; }
  | VariableDefinition
    { if (ctx.printReduceRule) std::cerr << "VariableDefinitionTail => VariableDefinition" << std::endl; }

%type <std::list<std::string>> IdentifierList;
IdentifierList
  : T_IDENTIFIER
    IdentifierListTail
    { if (ctx.printReduceRule) std::cerr << "IdentifierList => T_IDENTIFIER IdentifierListTail" << std::endl;  
      $$ = concat($1, $2); }
%type <std::list<std::string>> IdentifierListTail;
IdentifierListTail
  : { if (ctx.printReduceRule) std::cerr << "IdentifierListTail => " << std::endl;  
      $$ = {}; }
  | D_COMMA
    IdentifierList
    { if (ctx.printReduceRule) std::cerr << "IdentifierListTail => D_COMMA IdentifierList" << std::endl;  
      $$ = $2; }

%type <std::shared_ptr<AST::TypeInDeclaration>> TypeInDeclaration;
TypeInDeclaration
  : T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "TypeInDeclaration => T_IDENTIFIER" << std::endl;  
      $$ = std::make_shared<AST::TypeIdentifier>($1); }
  | ArraySchema
    { if (ctx.printReduceRule) std::cerr << "TypeInDeclaration => ArraySchema" << std::endl;  
      $$ = $1; }
  | PointerType
    { if (ctx.printReduceRule) std::cerr << "TypeInDeclaration => PointerType" << std::endl;  
      $$ = $1; }
%type <std::shared_ptr<AST::ArraySchema>> ArraySchema;
ArraySchema
  : K_ARRAY
    D_LSQUARE
    ArrayBound
    D_RSQUARE
    ArrayElementType
    { if (ctx.printReduceRule) std::cerr << "ArraySchema => K_ARRAY D_LSQUARE ArrayBound D_RSQUARE ArrayElementType" << std::endl;  
      $$ = std::make_shared<AST::ArraySchema>(std::move($3), $5); }
%type <std::string> ArrayElementType;
ArrayElementType
  :
    { if (ctx.printReduceRule) std::cerr << "ArrayElementType => " << std::endl;  
      $$ = "integer"; }
  | K_OF
    T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "ArrayElementType => K_OF T_IDENTIFIER" << std::endl;  
      $$ = $2; }
%type <std::list<std::shared_ptr<AST::ArrayDimensionalBound>>> ArrayBound;
ArrayBound
  : ArrayDimensionalBound
    ArrayBoundTail
    { if (ctx.printReduceRule) std::cerr << "ArrayBound => ArrayDimensionalBound ArrayBoundTail" << std::endl;  
      $$ = concat($1, $2); }
%type <std::list<std::shared_ptr<AST::ArrayDimensionalBound>>> ArrayBoundTail;
ArrayBoundTail
  : { if (ctx.printReduceRule) std::cerr << "ArrayBoundTail => " << std::endl;  
      $$ = {}; }
  | D_COMMA
    ArrayBound
    { if (ctx.printReduceRule) std::cerr << "ArrayBoundTail => D_COMMA ArrayBound" << std::endl;  
      $$ = $2; }
%type <std::shared_ptr<AST::ArrayDimensionalBound>> ArrayDimensionalBound;
ArrayDimensionalBound
  : ConstantValue
    D_DOTDOT
    ConstantValue
    { if (ctx.printReduceRule) std::cerr << "ArrayDimensionalBound => ConstantValue D_DOTDOT ConstantValue" << std::endl;  
      $$ = std::make_shared<AST::ArrayDimensionalBound>($1, $3); }

%type <std::shared_ptr<AST::PointerType>> PointerType;
PointerType
  : O_POINTER
    TypeInDeclaration
    { if (ctx.printReduceRule) std::cerr << "PointerType => O_POINTER TypeInDeclaration" << std::endl;  
      $$ = std::make_shared<AST::PointerType>($2); }

CallableDefinitionSection
  :
    { if (ctx.printReduceRule) std::cerr << "CallableDefinitionSection => " << std::endl; }
  | CallableDefinition
    { if (ctx.printReduceRule) std::cerr << "CallableDefinitionSection => CallableDefinition" << std::endl; }
CallableDefinition
  : ProcedureHeading
    D_SEMICON
    Block
    D_SEMICON
    { ctx.currentBlock->callables.push_back(std::make_shared<AST::Callable>(std::get<0>($1), std::move(std::get<1>($1)), std::get<2>($1), $3)); }
    CallableDefinitionTail
    { if (ctx.printReduceRule) std::cerr << "CallableDefinition => ProcedureHeading D_SEMICON Block D_SEMICON CallableDefinitionTail" << std::endl; }
  | FunctionHeading
    D_SEMICON
    Block
    D_SEMICON
    { ctx.currentBlock->callables.push_back(std::make_shared<AST::Callable>(std::get<0>($1), std::move(std::get<1>($1)), std::get<2>($1), $3)); }
    CallableDefinitionTail
    { if (ctx.printReduceRule) std::cerr << "CallableDefinition => FunctionHeading D_SEMICON Block D_SEMICON CallableDefinitionTail" << std::endl; }
CallableDefinitionTail
  :
    { if (ctx.printReduceRule) std::cerr << "CallableDefinitionTail => " << std::endl; }
  | CallableDefinition
    { if (ctx.printReduceRule) std::cerr << "CallableDefinitionTail => CallableDefinition" << std::endl; }

%type <std::tuple<std::string, std::list<std::shared_ptr<AST::Parameter>>, std::string>> ProcedureHeading;
ProcedureHeading
  : K_PROCEDURE
    T_IDENTIFIER
    D_LPAREN
    ParameterList
    D_RPAREN
    { if (ctx.printReduceRule) std::cerr << "ProcedureHeading => K_PROCEDURE T_IDENTIFIER D_LPAREN ParameterList D_RPAREN" << std::endl;  
      $$ = std::tuple<std::string, std::list<std::shared_ptr<AST::Parameter>>, std::string>($2, $4, ""); }
  | K_PROCEDURE
    T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "ProcedureHeading => K_PROCEDURE T_IDENTIFIER" << std::endl;  
      $$ = std::tuple<std::string, std::list<std::shared_ptr<AST::Parameter>>, std::string>($2, {}, ""); }
%type <std::tuple<std::string, std::list<std::shared_ptr<AST::Parameter>>, std::string>> FunctionHeading;
FunctionHeading
  : K_FUNCTION
    T_IDENTIFIER
    D_LPAREN
    ParameterList
    D_RPAREN
    D_COLON
    T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "FunctionHeading => K_FUNCTION T_IDENTIFIER D_LPAREN ParameterList D_RPAREN D_COLON T_IDENTIFIER" << std::endl;  
      $$ = std::tuple<std::string, std::list<std::shared_ptr<AST::Parameter>>, std::string>($2, $4, $7); }
  | K_FUNCTION
    T_IDENTIFIER
    D_COLON
    T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "FunctionHeading => K_FUNCTION T_IDENTIFIER D_COLON T_IDENTIFIER" << std::endl;  
      $$ = std::tuple<std::string, std::list<std::shared_ptr<AST::Parameter>>, std::string>($2, {}, $4); }

%type <std::list<std::shared_ptr<AST::Parameter>>> ParameterList;
ParameterList
  : ParameterListItem
    ParameterListTail
    { if (ctx.printReduceRule) std::cerr << "ParameterList => ParameterListItem ParameterListTail" << std::endl;  
      $$ = merge($1, $2); }
%type <std::list<std::shared_ptr<AST::Parameter>>> ParameterListTail;
ParameterListTail
  : { if (ctx.printReduceRule) std::cerr << "ParameterListTail => " << std::endl;  
      $$ = {}; }
  | D_SEMICON
    ParameterList
    { if (ctx.printReduceRule) std::cerr << "ParameterListTail => D_SEMICON ParameterList" << std::endl;  
      $$ = $2; }
%type <std::list<std::shared_ptr<AST::Parameter>>> ParameterListItem;
ParameterListItem
  : IdentifierList
    D_COLON
    TypeInDeclaration
    { if (ctx.printReduceRule) std::cerr << "ParameterListItem => IdentifierList D_COLON TypeInDeclaration" << std::endl;  
      $$ = map($1, [&] (auto x) { return std::make_shared<AST::Parameter>(x, $3, false); }); }
  | K_VAR
    IdentifierList
    D_COLON
    TypeInDeclaration
    { if (ctx.printReduceRule) std::cerr << "ParameterListItem => K_VAR IdentifierList D_COLON TypeInDeclaration" << std::endl;  
      $$ = map($2, [&] (auto x) { return std::make_shared<AST::Parameter>(x, $4, true); }); }

%type <std::shared_ptr<AST::CompoundStatement>> StatementSection;
StatementSection
  : Statement
    { ctx.currentBlock->statement = $1;  
      if (ctx.printReduceRule) std::cerr << "StatementSection => Statement" << std::endl; }

%type <std::shared_ptr<AST::Statement>> Statement;
Statement
  : { if (ctx.printReduceRule) std::cerr << "Statement => " << std::endl;  
      $$ = std::make_shared<AST::EmptyStatement>(); }
  | AssignmentStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => AssignmentStatement" << std::endl;  
      $$ = $1; }
  | ExplicitCallStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => ExplicitCallStatement" << std::endl;  
      $$ = $1; }
  | CompoundStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => CompoundStatement" << std::endl;  
      $$ = $1; }
  | WhileStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => WhileStatement" << std::endl;  
      $$ = $1; }
  | RepeatStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => RepeatStatement" << std::endl;  
      $$ = $1; }
  | ForStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => ForStatement" << std::endl;  
      $$ = $1; }
  | IfStatement
    { if (ctx.printReduceRule) std::cerr << "Statement => IfStatement" << std::endl;  
      $$ = $1; }
  | Expression
    { if (ctx.printReduceRule) std::cerr << "Statement => Expression" << std::endl;  
      $$ = std::make_shared<AST::ExpressionStatement>($1); }

%type <std::shared_ptr<AST::AssignmentStatement>> AssignmentStatement;
AssignmentStatement
  : MaybeLeftValueExpression
    O_ASSIGN
    Expression
    { if (ctx.printReduceRule) std::cerr << "AssignmentStatement => MaybeLeftValueExpression O_ASSIGN Expression" << std::endl;  
      $$ = std::make_shared<AST::AssignmentStatement>($1, $3); }

%type <std::shared_ptr<AST::ExplicitCallStatement>> ExplicitCallStatement;
ExplicitCallStatement
  : K_CALL
    T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "ExplicitCallStatement => K_CALL T_IDENTIFIER" << std::endl;  
      $$ = std::make_shared<AST::ExplicitCallStatement>($2); }

%type <std::shared_ptr<AST::CompoundStatement>> CompoundStatement;
CompoundStatement
  : K_BEGIN
    StatementSequence
    K_END
    { if (ctx.printReduceRule) std::cerr << "CompoundStatement => K_BEGIN StatementSequence K_END" << std::endl;  
      $$ = std::make_shared<AST::CompoundStatement>($2); }
%type <std::list<std::shared_ptr<AST::Statement>>> StatementSequence;
StatementSequence
  : Statement
    StatementSequenceTail
    { if (ctx.printReduceRule) std::cerr << "StatementSequence => Statement StatementSequenceTail" << std::endl;  
      $$ = concat($1, $2); }
%type <std::list<std::shared_ptr<AST::Statement>>> StatementSequenceTail;
StatementSequenceTail
  : { if (ctx.printReduceRule) std::cerr << "StatementSequenceTail => " << std::endl;  
      $$ = {}; }
  | D_SEMICON
    StatementSequence
    { if (ctx.printReduceRule) std::cerr << "StatementSequenceTail => D_SEMICON StatementSequence" << std::endl;  
      $$ = $2; }

%type <std::shared_ptr<AST::WhileStatement>> WhileStatement;
WhileStatement
  : K_WHILE
    Expression
    K_DO
    Statement
    { if (ctx.printReduceRule) std::cerr << "WhileStatement => K_WHILE Expression K_DO Statement" << std::endl;  
      $$ = std::make_shared<AST::WhileStatement>($2, $4); }

%type <std::shared_ptr<AST::RepeatStatement>> RepeatStatement;
RepeatStatement
  : K_REPEAT
    StatementSequence
    K_UNTIL
    Expression
    { if (ctx.printReduceRule) std::cerr << "RepeatStatement => K_REPEAT StatementSequence K_UNTIL Expression" << std::endl;  
      $$ = std::make_shared<AST::RepeatStatement>($4, std::make_shared<AST::CompoundStatement>($2)); }

%type <std::shared_ptr<AST::ForStatement>> ForStatement;
ForStatement
  : K_FOR
    T_IDENTIFIER
    O_ASSIGN
    Expression
    ForDirection
    Expression
    K_DO
    Statement
    { if (ctx.printReduceRule) std::cerr << "ForStatement => K_FOR T_IDENTIFIER O_ASSIGN Expression ForDirection Expression K_DO Statement" << std::endl;  
      $$ = std::make_shared<AST::ForStatement>($2, $4, $5, $6, $8); }
%type <AST::ForStatement::Direction> ForDirection;
ForDirection
  : K_TO
    { if (ctx.printReduceRule) std::cerr << "ForDirection => K_TO" << std::endl;  
      $$ = AST::ForStatement::Direction::Up; }
  | K_DOWNTO
    { if (ctx.printReduceRule) std::cerr << "ForDirection => K_DOWNTO" << std::endl;  
      $$ = AST::ForStatement::Direction::Down; }

%nonassoc K_THEN;
%nonassoc K_ELSE;
%type <std::shared_ptr<AST::IfStatement>> IfStatement;
IfStatement
  : K_IF
    Expression
    K_THEN
    Statement
    K_ELSE
    Statement
    { if (ctx.printReduceRule) std::cerr << "IfStatement => K_IF Expression K_THEN Statement K_ELSE Statement" << std::endl;  
      $$ = std::make_shared<AST::IfStatement>($2, $4, $6); }
  | K_IF
    Expression
    K_THEN
    Statement
    { if (ctx.printReduceRule) std::cerr << "IfStatement => K_IF Expression K_THEN Statement" << std::endl;  
      $$ = std::make_shared<AST::IfStatement>($2, $4, std::make_shared<AST::EmptyStatement>()); }

%type <std::shared_ptr<AST::MaybeLeftValueExpression>> MaybeLeftValueExpression;
MaybeLeftValueExpression
  : T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "MaybeLeftValueExpression => T_IDENTIFIER" << std::endl;  
      $$ = std::make_shared<AST::IdentifierExpression>($1); }
  | RecordAccessExpression
    { if (ctx.printReduceRule) std::cerr << "MaybeLeftValueExpression => RecordAccessExpression" << std::endl;  
      $$ = $1; }
  | ArrayAccessExpression
    { if (ctx.printReduceRule) std::cerr << "MaybeLeftValueExpression => ArrayAccessExpression" << std::endl;  
      $$ = $1; }
  | PointerAccessExpression
    { if (ctx.printReduceRule) std::cerr << "MaybeLeftValueExpression => PointerAccessExpression" << std::endl;  
      $$ = $1; }
%type <std::shared_ptr<AST::RecordAccessExpression>> RecordAccessExpression;
RecordAccessExpression
  : MaybeLeftValueExpression
    D_DOT
    T_IDENTIFIER
    { if (ctx.printReduceRule) std::cerr << "RecordAccessExpression => MaybeLeftValueExpression D_DOT T_IDENTIFIER" << std::endl;  
      $$ = std::make_shared<AST::RecordAccessExpression>($1, $3); }
%type <std::shared_ptr<AST::ArrayAccessExpression>> ArrayAccessExpression;
ArrayAccessExpression
  : MaybeLeftValueExpression
    D_LSQUARE
    ExpressionList
    D_RSQUARE
    { if (ctx.printReduceRule) std::cerr << "ArrayAccessExpression => MaybeLeftValueExpression D_LSQUARE ExpressionList D_RSQUARE" << std::endl;  
      $$ = std::make_shared<AST::ArrayAccessExpression>($1, $3); }
%type <std::list<std::shared_ptr<AST::Expression>>> ExpressionList;
ExpressionList
  : Expression
    ExpressionListTail
    { if (ctx.printReduceRule) std::cerr << "ExpressionList => Expression ExpressionListTail" << std::endl;  
      $$ = concat($1, $2); }
%type <std::list<std::shared_ptr<AST::Expression>>> ExpressionListTail;
ExpressionListTail
  : { if (ctx.printReduceRule) std::cerr << "ExpressionListTail => " << std::endl;  
      $$ = {}; }
  | D_COMMA
    ExpressionList
    { if (ctx.printReduceRule) std::cerr << "ExpressionListTail => D_COMMA ExpressionList" << std::endl;  
      $$ = $2; }
%type <std::shared_ptr<AST::PointerAccessExpression>> PointerAccessExpression;
PointerAccessExpression
  : MaybeLeftValueExpression
    O_POINTER
    { if (ctx.printReduceRule) std::cerr << "PointerAccessExpression => MaybeLeftValueExpression O_POINTER" << std::endl;  
      $$ = std::make_shared<AST::PointerAccessExpression>($1); }
  | CallExpressionWithArguments
    O_POINTER
    { if (ctx.printReduceRule) std::cerr << "PointerAccessExpression => CallExpressionWithArguments O_POINTER" << std::endl;  
      $$ = std::make_shared<AST::PointerAccessExpression>($1); }

%type <std::shared_ptr<AST::Expression>> Expression;
Expression
  : OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "Expression => OperatorExpression" << std::endl;  
      $$ = $1; }
%type <std::shared_ptr<AST::Expression>> NonOperatorExpression;
NonOperatorExpression
  : MaybeLeftValueExpression
    { if (ctx.printReduceRule) std::cerr << "NonOperatorExpression => MaybeLeftValueExpression" << std::endl;  
      $$ = $1; }
  | CallExpressionWithArguments
    { if (ctx.printReduceRule) std::cerr << "NonOperatorExpression => CallExpressionWithArguments" << std::endl;  
      $$ = $1; }
  | Sign T_NUMBER
    { if (ctx.printReduceRule) std::cerr << "NonOperatorExpression => Sign T_NUMBER" << std::endl;  
      $$ = std::make_shared<AST::ConstantExpression>($1 + $2); }
  | T_STRING
    { if (ctx.printReduceRule) std::cerr << "NonOperatorExpression => T_STRING" << std::endl;  
      $$ = std::make_shared<AST::ConstantExpression>($1); }

%left O_EQ O_NE O_LT O_GT O_LE O_GE;
%left O_PLUS O_MINUS O_OR O_XOR;
%left O_TIMES O_SLASH O_DIV O_MOD O_AND O_SHL O_SHR;
%type <std::shared_ptr<AST::Expression>> OperatorExpression;
OperatorExpression
  : UnaryOperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => UnaryOperatorExpression" << std::endl;
      $$ = $1; }
  | OperatorExpression O_EQ    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_EQ    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Equal, $3); }
  | OperatorExpression O_NE    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_NE    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::NotEqual, $3); }
  | OperatorExpression O_LT    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_LT    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::LessThan, $3); }
  | OperatorExpression O_GT    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_GT    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::GreaterThan, $3); }
  | OperatorExpression O_LE    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_LE    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::LessThanOrEqual, $3); }
  | OperatorExpression O_GE    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_GE    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::GreaterThanOrEqual, $3); }
  | OperatorExpression O_PLUS  OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_PLUS  OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Plus, $3); }
  | OperatorExpression O_MINUS OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_MINUS OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Minus, $3); }
  | OperatorExpression O_OR    OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_OR    OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Or, $3); }
  | OperatorExpression O_XOR   OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_XOR   OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Xor, $3); }
  | OperatorExpression O_TIMES OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_TIMES OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Times, $3); }
  | OperatorExpression O_SLASH OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_SLASH OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Slash, $3); }
  | OperatorExpression O_DIV   OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_DIV   OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Div, $3); }
  | OperatorExpression O_MOD   OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_MOD   OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::Mod, $3); }
  | OperatorExpression O_AND   OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_AND   OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::And, $3); }
  | OperatorExpression O_SHL   OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_SHL   OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::LeftShift, $3); }
  | OperatorExpression O_SHR   OperatorExpression
    { if (ctx.printReduceRule) std::cerr << "OperatorExpression => OperatorExpression O_SHR   OperatorExpression" << std::endl;
      $$ = std::make_shared<AST::BinaryOperatorExpression>($1, AST::BinaryOperator::RightShift, $3); }
%type <std::shared_ptr<AST::Expression>> UnaryOperatorExpression;
UnaryOperatorExpression
  :         NonOperatorExpression
    { if (ctx.printReduceRule) std::cerr << "UnaryOperatorExpression => NonOperatorExpression" << std::endl;  
      $$ = $1; }
  |         ParenthesesExpression
    { if (ctx.printReduceRule) std::cerr << "UnaryOperatorExpression => ParenthesesExpression" << std::endl;  
      $$ = $1; }
  | O_NOT   UnaryOperatorExpression
    { if (ctx.printReduceRule) std::cerr << "UnaryOperatorExpression => O_NOT   UnaryOperatorExpression" << std::endl;  
      $$ = std::make_shared<AST::UnaryOperatorExpression>(AST::UnaryOperator::Not, $2); }
  | O_PLUS  UnaryOperatorExpression
    { if (ctx.printReduceRule) std::cerr << "UnaryOperatorExpression => O_PLUS  UnaryOperatorExpression" << std::endl;  
      $$ = std::make_shared<AST::UnaryOperatorExpression>(AST::UnaryOperator::Plus, $2); }
  | O_MINUS UnaryOperatorExpression
    { if (ctx.printReduceRule) std::cerr << "UnaryOperatorExpression => O_MINUS UnaryOperatorExpression" << std::endl;  
      $$ = std::make_shared<AST::UnaryOperatorExpression>(AST::UnaryOperator::Minus, $2); }
  | O_AT    UnaryOperatorExpression
    { if (ctx.printReduceRule) std::cerr << "UnaryOperatorExpression => O_AT    UnaryOperatorExpression" << std::endl;  
      $$ = std::make_shared<AST::UnaryOperatorExpression>(AST::UnaryOperator::At, $2); }
%type <std::shared_ptr<AST::Expression>> ParenthesesExpression;
ParenthesesExpression
  : D_LPAREN Expression D_RPAREN
    { if (ctx.printReduceRule) std::cerr << "ParenthesesExpression => D_LPAREN Expression D_RPAREN" << std::endl;  
      $$ = $2; }

%type <std::shared_ptr<AST::CallExpressionWithArguments>> CallExpressionWithArguments;
CallExpressionWithArguments
  : T_IDENTIFIER
    CallArgumentList
    { if (ctx.printReduceRule) std::cerr << "CallExpressionWithArguments => T_IDENTIFIER CallArgumentList" << std::endl;  
      $$ = std::make_shared<AST::CallExpressionWithArguments>($1, $2); }
%type <std::list<std::shared_ptr<AST::Expression>>> CallArgumentList;
CallArgumentList
  : D_LPAREN
    CallArgumentListContent
    D_RPAREN
    { if (ctx.printReduceRule) std::cerr << "CallArgumentList => D_LPAREN CallArgumentListContent D_RPAREN" << std::endl;  
      $$ = $2; }
  | D_LPAREN
    D_RPAREN
    { if (ctx.printReduceRule) std::cerr << "CallArgumentList => D_LPAREN D_RPAREN" << std::endl;  
      $$ = {}; }
%type <std::list<std::shared_ptr<AST::Expression>>> CallArgumentListContent;
CallArgumentListContent
  : Expression
    CallArgumentListContentTail
    { if (ctx.printReduceRule) std::cerr << "CallArgumentListContent => Expression CallArgumentListContentTail" << std::endl;  
      $$ = concat($1, $2); }
%type <std::list<std::shared_ptr<AST::Expression>>> CallArgumentListContentTail;
CallArgumentListContentTail
  : { if (ctx.printReduceRule) std::cerr << "CallArgumentListContentTail => " << std::endl;  
      $$ = {}; }
  | D_COMMA
    CallArgumentListContent
    { if (ctx.printReduceRule) std::cerr << "CallArgumentListContentTail => D_COMMA CallArgumentListContent" << std::endl;  
      $$ = $2; }
%%

void __attribute__((noreturn)) yy::parser::error(const location_type &location, const std::string &message) {
    std::cerr << location << ": " << message << std::endl;
    exit(EXIT_FAILURE);
}
