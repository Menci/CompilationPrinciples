#ifndef _MENCI_AST_H
#define _MENCI_AST_H

#include <string>
#include <vector>
#include <memory>

#include "ast-print.h"

struct Program;
struct Block;
struct Constant;
struct TypeAlias;
struct Type;
struct Variable;
struct TypeInDeclaration;
struct ArraySchema;
struct ArrayDimensionalBound;
struct PointerType;
struct Callable;
struct Statement;
struct ExplicitCallStatement;
struct CompoundStatement;
struct WhileStatement;
struct RepeatStatement;
struct ForStatement;
struct IfStatement;
struct ExpressionStatement;
struct EmptyStatement;
struct Expression;
struct MaybeLeftValueExpression;
struct IdentifierExpression;
struct RecordAccessExpression;
struct ArrayAccessExpression;
struct PointerAccessExpression;
struct ConstantExpression;
struct BinaryOperatorExpression;
struct UnaryOperatorExpression;
struct CallExpressionWithArguments;

enum class BinaryOperator {
    Equal,
    NotEqual,
    LessThan,
    GreaterThan,
    LessThanOrEqual,
    GreaterThanOrEqual,
    Plus,
    Minus,
    Or,
    Xor,
    Times,
    Slash,
    Div,
    Mod,
    And,
    LeftShift,
    RightShift
};

inline std::string getBinaryOperatorName(BinaryOperator op) {
    switch (op) {
    case BinaryOperator::Equal:
        return "Equal";
    case BinaryOperator::NotEqual:
        return "NotEqual";
    case BinaryOperator::LessThan:
        return "LessThan";
    case BinaryOperator::GreaterThan:
        return "GreaterThan";
    case BinaryOperator::LessThanOrEqual:
        return "LessThanOrEqual";
    case BinaryOperator::GreaterThanOrEqual:
        return "GreaterThanOrEqual";
    case BinaryOperator::Plus:
        return "Plus";
    case BinaryOperator::Minus:
        return "Minus";
    case BinaryOperator::Or:
        return "Or";
    case BinaryOperator::Xor:
        return "Xor";
    case BinaryOperator::Times:
        return "Times";
    case BinaryOperator::Slash:
        return "Slash";
    case BinaryOperator::Div:
        return "Div";
    case BinaryOperator::Mod:
        return "Mod";
    case BinaryOperator::And:
        return "And";
    case BinaryOperator::LeftShift:
        return "LeftShift";
    case BinaryOperator::RightShift:
        return "RightShift";
    }
}

inline std::ostream &operator<<(std::ostream &stream, BinaryOperator op) { return stream << getBinaryOperatorName(op); }

enum class UnaryOperator {
    Not,
    Plus,
    Minus,
    At
};

inline std::string getUnaryOperatorName(UnaryOperator op) {
    switch (op) {
    case UnaryOperator::Not:
        return "Not";
    case UnaryOperator::Plus:
        return "Plus";
    case UnaryOperator::Minus:
        return "Minus";
    case UnaryOperator::At:
        return "At";
    }
}

inline std::ostream &operator<<(std::ostream &stream, UnaryOperator op) { return stream << getUnaryOperatorName(op); }

struct Program : Printable {
    std::string name;
    std::shared_ptr<Block> topLevelBlock;

    Program(const std::string &name, std::shared_ptr<Block> topLevelBlock) : name(name), topLevelBlock(topLevelBlock) {}

    void printTo(PrintStream &s) const {
        s << PRINT(name);
        s << PRINT(topLevelBlock);
    }
};

struct Block : Printable {
    std::weak_ptr<Block> parentBlock;

    std::vector<std::shared_ptr<Constant>> constants;
    std::vector<std::shared_ptr<TypeAlias>> typeAliases;
    std::vector<std::shared_ptr<Variable>> variables;
    std::vector<std::shared_ptr<Callable>> callables;
    std::shared_ptr<Statement> statement;

    Block(std::shared_ptr<Block> parentBlock) : parentBlock(parentBlock) {}

    void printTo(PrintStream &s) const {
        s << PRINT(constants);
        s << PRINT(typeAliases);
        s << PRINT(variables);
        s << PRINT(callables);
        s << PRINT(statement);
    }
};

struct Constant : Printable {
    std::string name, value;

    Constant(const std::string &name, const std::string &value) : name(name), value(value) {}

    void printTo(PrintStream &s) const {
        s << PRINT(name);
        s << PRINT(value);
    }
};

struct TypeAlias : Printable {
    std::string name;
    std::shared_ptr<Type> type;

    TypeAlias(const std::string &name, std::shared_ptr<Type> type) : name(name), type(type) {}

    void printTo(PrintStream &s) const {
        s << PRINT(name);
        s << PRINT(type);
    }
};

struct Variable : Printable {
    std::string name;
    std::shared_ptr<TypeInDeclaration> type;

    Variable(const std::string &name, std::shared_ptr<TypeInDeclaration> type) : name(name), type(type) {}

    void printTo(PrintStream &s) const {
        s << PRINT(name);
        s << PRINT(type);
    }
};

struct Type : Printable {};

struct RecordType : Type {
    std::vector<std::shared_ptr<Variable>> variables;

    RecordType(std::vector<std::shared_ptr<Variable>> &&variables) : variables(variables) {}

    void printTo(PrintStream &s) const {
        s << PRINT(variables);
    }
};

struct TypeInDeclaration : Type {};

struct TypeIdentifier : TypeInDeclaration {
    std::string name;

    TypeIdentifier(const std::string &name) : name(name) {}

    void printTo(PrintStream &s) const {
        s << PRINT(name);
    }
};

struct ArraySchema : TypeInDeclaration {
    std::vector<std::shared_ptr<ArrayDimensionalBound>> bounds;

    ArraySchema(std::vector<std::shared_ptr<ArrayDimensionalBound>> &&bounds) : bounds(bounds) {}

    void printTo(PrintStream &s) const {
        s << PRINT(bounds);
    }
};

struct ArrayDimensionalBound : Printable {
    std::string min, max;

    ArrayDimensionalBound(std::string min, std::string max) : min(min), max(max) {}

    void printTo(PrintStream &s) const {
        s << PRINT(min);
        s << PRINT(max);
    }
};

struct PointerType : TypeInDeclaration {
    std::shared_ptr<Type> baseType;

    PointerType(std::shared_ptr<Type> baseType) : baseType(baseType) {}

    void printTo(PrintStream &s) const {
        s << PRINT(baseType);
    }
};

struct Callable : Printable {
    std::string name;
    std::vector<std::shared_ptr<Variable>> parameters;
    std::string returnType;
    std::shared_ptr<Block> block;

    Callable(const std::string &name, std::vector<std::shared_ptr<Variable>> &&parameters, std::string returnType, std::shared_ptr<Block> block)
    : name(name), parameters(parameters), returnType(returnType), block(block) {}

    void printTo(PrintStream &s) const {
        s << PRINT(name);
        s << PRINT(parameters);
        s << PRINT(returnType);
        s << PRINT(block);
    }
};

struct Statement : Printable {};

struct AssignmentStatement : Statement {
    std::shared_ptr<MaybeLeftValueExpression> left;
    std::shared_ptr<Expression> right;

    AssignmentStatement(std::shared_ptr<MaybeLeftValueExpression> left, std::shared_ptr<Expression> right) : left(left), right(right) {}

    void printTo(PrintStream &s) const {
        s << PRINT(left);
        s << PRINT(right);
    }
};

struct ExplicitCallStatement : Statement {
    std::string functionName;

    ExplicitCallStatement(const std::string &functionName) : functionName(functionName) {}

    void printTo(PrintStream &s) const {
        s << PRINT(functionName);
    }
};

struct CompoundStatement : Statement {
    std::vector<std::shared_ptr<Statement>> statements;

    CompoundStatement(std::vector<std::shared_ptr<Statement>> statements) : statements(statements) {}

    void printTo(PrintStream &s) const {
        s << PRINT(statements);
    }
};

struct WhileStatement : Statement {
    std::shared_ptr<Expression> condition;
    std::shared_ptr<Statement> statement;

    WhileStatement(std::shared_ptr<Expression> condition, std::shared_ptr<Statement> statement) : condition(condition), statement(statement) {}

    void printTo(PrintStream &s) const {
        s << PRINT(condition);
        s << PRINT(statement);
    }
};

struct RepeatStatement : Statement {
    std::shared_ptr<Expression> condition;
    std::shared_ptr<Statement> statement;

    RepeatStatement(std::shared_ptr<Expression> condition, std::shared_ptr<Statement> statement) : condition(condition), statement(statement) {}

    void printTo(PrintStream &s) const {
        s << PRINT(condition);
        s << PRINT(statement);
    }
};

struct ForStatement : Statement {
    enum struct Direction { Up, Down };

    std::string variable;
    std::shared_ptr<Expression> initialValue;
    Direction direction;
    std::shared_ptr<Expression> finalValue;
    std::shared_ptr<Statement> statement;

    ForStatement(std::string variable, std::shared_ptr<Expression> initialValue, Direction direction, std::shared_ptr<Expression> finalValue, std::shared_ptr<Statement> statement)
    : variable(variable), initialValue(initialValue), direction(direction), finalValue(finalValue), statement(statement) {}

    void printTo(PrintStream &s) const {
        s << PRINT(variable);
        s << PRINT(initialValue);
        s << PRINT(direction);
        s << PRINT(finalValue);
        s << PRINT(statement);
    }
};

inline std::ostream &operator<<(std::ostream &stream, ForStatement::Direction direction) {
    return stream << (direction == ForStatement::Direction::Up ? "Up" : "Down");
}

struct IfStatement : Statement {
    std::shared_ptr<Expression> condition;
    std::shared_ptr<Statement> statementForTrue;
    std::shared_ptr<Statement> statementForFalse;

    IfStatement(std::shared_ptr<Expression> condition, std::shared_ptr<Statement> statementForTrue, std::shared_ptr<Statement> statementForFalse)
    : condition(condition), statementForTrue(statementForTrue), statementForFalse(statementForFalse) {}

    void printTo(PrintStream &s) const {
        s << PRINT(condition);
        s << PRINT(statementForTrue);
        s << PRINT(statementForFalse);
    }
};

struct ExpressionStatement : Statement {
    std::shared_ptr<Expression> expression;

    ExpressionStatement(std::shared_ptr<Expression> expression) : expression(expression) {}

    void printTo(PrintStream &s) const {
        s << PRINT(expression);
    }
};

struct EmptyStatement : Statement {
    EmptyStatement() {}

    void printTo(PrintStream &s) const {}
};

struct Expression : Printable {};

struct MaybeLeftValueExpression : Expression {};

struct IdentifierExpression : MaybeLeftValueExpression {
    std::string identifier;

    IdentifierExpression(const std::string &identifier) : identifier(identifier) {}

    void printTo(PrintStream &s) const {
        s << PRINT(identifier);
    }
};

struct RecordAccessExpression : MaybeLeftValueExpression {
    std::shared_ptr<MaybeLeftValueExpression> record;
    std::string member;

    RecordAccessExpression(std::shared_ptr<MaybeLeftValueExpression> record, std::string member) : record(record), member(member) {}

    void printTo(PrintStream &s) const {
        s << PRINT(record);
        s << PRINT(member);
    }
};

struct ArrayAccessExpression : MaybeLeftValueExpression {
    std::shared_ptr<MaybeLeftValueExpression> array;
    std::vector<std::shared_ptr<Expression>> indexes;

    ArrayAccessExpression(std::shared_ptr<MaybeLeftValueExpression> array, std::vector<std::shared_ptr<Expression>> indexes)
    : array(array), indexes(indexes) {}

    void printTo(PrintStream &s) const {
        s << PRINT(array);
        s << PRINT(indexes);
    }
};

struct PointerAccessExpression : MaybeLeftValueExpression {
    std::shared_ptr<Expression> pointer;

    PointerAccessExpression(std::shared_ptr<Expression> pointer) : pointer(pointer) {}

    void printTo(PrintStream &s) const {
        s << PRINT(pointer);
    }
};

struct ConstantExpression : Expression {
    std::string value;

    ConstantExpression(const std::string &value) : value(value) {}

    void printTo(PrintStream &s) const {
        s << PRINT(value);
    }
};

struct BinaryOperatorExpression : Expression {
    std::shared_ptr<Expression> leftOperand;
    BinaryOperator op;
    std::shared_ptr<Expression> rightOperand;

    BinaryOperatorExpression(std::shared_ptr<Expression> leftOperand, BinaryOperator op, std::shared_ptr<Expression> rightOperand) : leftOperand(leftOperand), op(op), rightOperand(rightOperand) {}

    void printTo(PrintStream &s) const {
        s << PRINT(leftOperand);
        s << PRINT(op);
        s << PRINT(rightOperand);
    }
};

struct UnaryOperatorExpression : Expression {
    UnaryOperator op;
    std::shared_ptr<Expression> operand;

    UnaryOperatorExpression(UnaryOperator op, std::shared_ptr<Expression> operand) : op(op), operand(operand) {}

    void printTo(PrintStream &s) const {
        s << PRINT(op);
        s << PRINT(operand);
    }
};

struct CallExpressionWithArguments : Expression {
    std::string functionName;
    std::vector<std::shared_ptr<Expression>> argumentList;

    CallExpressionWithArguments(std::string functionName, std::vector<std::shared_ptr<Expression>> argumentList)
    : functionName(functionName), argumentList(argumentList) {}

    void printTo(PrintStream &s) const {
        s << PRINT(functionName);
        s << PRINT(argumentList);
    }
};

#endif // _MENCI_AST_H
