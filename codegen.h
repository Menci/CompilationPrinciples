#ifndef _MENCI_CODEGEN_H
#define _MENCI_CODEGEN_H

#include <map>
#include <vector>
#include <memory>
#include <utility>
#include <iostream>
#include <fmt/format.h>

#include "ast.h"

namespace CodeGen {

const char *REG_FRAME_BASE = "rbx";
const char *REG_RETURN_VALUE = "r15";
const char *REG_LEFT_VALUE_POINTER = "r14";

template <typename ...Args>
void __attribute__((noreturn)) reportError(const std::string &format, Args &&...args) {
    auto message = fmt::format(format, args...);
    std::cerr << message << std::endl;
    exit(EXIT_FAILURE);
}

class AssemblyContext {
    std::list<std::string> lines;
    inline static size_t id = 0;
    std::string label;

public:
    AssemblyContext(const std::string &label) : label(fmt::format(".{}_{}", label, ++id)) {
        lines.push_back(this->label + ":");
    }

    template <typename ...Args>
    void generate(const std::string &format, Args &&...args) {
        auto instruction = fmt::format(format, args...);
        lines.push_back("    " + instruction);
    }

    void append(AssemblyContext &&ctx) {
        lines.splice(lines.end(), ctx.lines);
    }

    std::string getLabel() const {
        return label;
    }

    std::string getCode() const {
        std::string result;
        for (auto line : lines) result += line + "\n";
        return result;
    }
};

class Type {
public:
    virtual ~Type() = default;

    virtual void onInitialize(AssemblyContext &ctx) const = 0;
    virtual void onAssign(AssemblyContext &ctx) const = 0;

    virtual bool allowedPassByValue() const { return false; }
    virtual bool needFinalize() const { return false; }
    virtual void onFinalize(AssemblyContext &ctx) const {}

    virtual std::string getSignature() const = 0;

    bool operator==(const Type &other) const { return getSignature() == other.getSignature(); }
    bool operator!=(const Type &other) const { return getSignature() != other.getSignature(); }
};

class TypeInteger : public Type {
public:
    virtual void onInitialize(AssemblyContext &ctx) const {
        ctx.generate("mov qword ptr [{}], 0", REG_LEFT_VALUE_POINTER);
    }

    virtual void onAssign(AssemblyContext &ctx) const {
        ctx.generate("pop qword ptr [{}]", REG_LEFT_VALUE_POINTER);
    }

    virtual bool allowedPassByValue() const { return true; }

    virtual std::string getSignature() const {
        return "integer";
    }
};

class TypeDouble : public Type {
public:
    virtual void onInitialize(AssemblyContext &ctx) const {
        ctx.generate("mov qword ptr [{}], 0", REG_LEFT_VALUE_POINTER);
    }

    virtual void onAssign(AssemblyContext &ctx) const {
        ctx.generate("pop qword ptr [{}]", REG_LEFT_VALUE_POINTER);
    }

    virtual bool allowedPassByValue() const { return true; }

    virtual std::string getSignature() const {
        return "double";
    }
};

class TypePointer : public Type {
public:
    std::shared_ptr<Type> valueType;

    TypePointer(std::shared_ptr<Type> valueType) : valueType(valueType) {}

    virtual void onInitialize(AssemblyContext &ctx) const {
        ctx.generate("mov qword ptr [{}], 0", REG_LEFT_VALUE_POINTER);
    }

    virtual void onAssign(AssemblyContext &ctx) const {
        ctx.generate("pop qword ptr [{}]", REG_LEFT_VALUE_POINTER);
    }

    virtual bool allowedPassByValue() const { return true; }

    virtual std::string getSignature() const {
        return "pointer of " + valueType->getSignature();
    }
};

class TypeString : public Type {
public:
    virtual void onInitialize(AssemblyContext &ctx) const {
        ctx.generate("mov rdi, 1");
        ctx.generate("lea rax, malloc[rip]");
        ctx.generate("call builtin$callsysv");
        ctx.generate("mov byte ptr [rax], 0");
        ctx.generate("mov qword ptr [{}], rax", REG_LEFT_VALUE_POINTER);
    }

    virtual void onAssign(AssemblyContext &ctx) const {
        ctx.generate("mov rdi, qword ptr [{}]", REG_LEFT_VALUE_POINTER);
        ctx.generate("lea rax, free[rip]");
        ctx.generate("call builtin$callsysv");

        ctx.generate("mov rdi, qword ptr [rsp]");
        ctx.generate("lea rax, strlen[rip]");
        ctx.generate("call builtin$callsysv");

        ctx.generate("mov rdi, rax");
        ctx.generate("lea rax, malloc[rip]");
        ctx.generate("call builtin$callsysv");
        ctx.generate("mov qword ptr [{}], rax", REG_LEFT_VALUE_POINTER);

        ctx.generate("mov rdi, rax");
        ctx.generate("pop rsi");
        ctx.generate("lea rax, strcpy[rip]");
        ctx.generate("call builtin$callsysv");
    }

    virtual bool needFinalize() const { return true; }
    virtual void onFinalize(AssemblyContext &ctx) const {
        ctx.generate("mov rdi, qword ptr [{}]", REG_LEFT_VALUE_POINTER);
        ctx.generate("lea rax, free[rip]");
        ctx.generate("call builtin$callsysv");
    }

    virtual std::string getSignature() const {
        return "string";
    }
};

auto builtinTypeInteger = std::make_shared<TypeInteger>();
auto builtinTypeDouble = std::make_shared<TypeDouble>();
auto builtinTypeString = std::make_shared<TypeString>();
std::map<std::string, std::shared_ptr<Type>> builtinTypes = {
    {"integer", builtinTypeInteger},
    {"double", builtinTypeDouble},
    {"string", builtinTypeString}
};

class Symbol {
public:
    virtual ~Symbol() = default;
};

class Constant : public Symbol {
public:
    std::shared_ptr<Type> type;
    std::string literalValue;
    std::string label;

    Constant(const std::string &literalValue) : literalValue(literalValue) {
        if (literalValue[0] == '\'') type = builtinTypeString;
        else if (literalValue.find(".") == std::string::npos && literalValue.find("e") == std::string::npos) type = builtinTypeInteger;
        else type = builtinTypeDouble;
    }

    void generate(AssemblyContext &ctx) {
        auto nctx = AssemblyContext("Constant");
        if (type == builtinTypeString) {
            std::string s = ".byte ";
            for (size_t i = 1; i < literalValue.size() - 1; i++) {
                s += std::to_string((int)literalValue[i]) + ", ";
                if (literalValue[i] == '\'') i++;
            }
            s += "0";
            nctx.generate(s);
        } else if (type == builtinTypeInteger) {
            nctx.generate(".quad {}", literalValue);
        } else {
            nctx.generate(".double {}", literalValue);
        }
        label = nctx.getLabel();
        ctx.append(std::move(nctx));
    }

    void onLoadToStack(AssemblyContext &ctx) const {
        if (type == builtinTypeString) {
            ctx.generate("lea rax, {}[rip]", label);
        } else {
            ctx.generate("mov rax, {}[rip]", label);
        }
        ctx.generate("push rax");
    }
};

class Variable : public Symbol {
public:
    std::shared_ptr<Type> type;
    ssize_t frameOffset;
    bool isReference;

    Variable(std::shared_ptr<Type> type, ssize_t frameOffset, bool isReference = false)
    : type(type), frameOffset(frameOffset), isReference(isReference) {}

    void onLoadPointerToRegister(AssemblyContext &ctx) const {
        ctx.generate("mov rax, {}", frameOffset);
        ctx.generate("lea {}, qword ptr [{} + rax * 8]", REG_LEFT_VALUE_POINTER, REG_FRAME_BASE);
    }

    void onLoadToStack(AssemblyContext &ctx) const {
        ctx.generate("mov rax, {}", frameOffset);
        ctx.generate("mov rax, qword ptr [{} + rax * 8]", REG_FRAME_BASE);
        ctx.generate("push rax");
    }

    void onInitialize(AssemblyContext &ctx) const {
        onLoadPointerToRegister(ctx);
        type->onInitialize(ctx);
    }

    void onFinalize(AssemblyContext &ctx) const {
        if (!type->needFinalize()) return;
        onLoadPointerToRegister(ctx);
        type->onFinalize(ctx);
    }
};

class Frame {
public:
    std::map<std::string, std::shared_ptr<Variable>> variables;

    void onInitialize(AssemblyContext &ctx) const {
        for (auto [name, var] : variables) {
            ctx.generate("push {}", REG_FRAME_BASE);
            var->onInitialize(ctx);
            ctx.generate("pop {}", REG_FRAME_BASE);
        }
    }

    void onFinalize(AssemblyContext &ctx) const {
        for (auto [name, var] : variables) {
            if (var->type->needFinalize()) {
                ctx.generate("push {}", REG_FRAME_BASE);
                var->onFinalize(ctx);
                ctx.generate("pop {}", REG_FRAME_BASE);
            }
        }
    }

    // For record
    bool needFinalize() const {
        for (auto [name, var] : variables)
            if (var->type->needFinalize()) return true;
        return false;
    }
};

class TypeRecord : public Type {
    Frame frame;
    size_t count;

public:
    TypeRecord(std::map<std::string, std::shared_ptr<Variable>> variables) : count(variables.size()) {
        frame.variables = variables;
    }

    std::shared_ptr<Variable> resolveMember(const std::string &name) const {
        auto it = frame.variables.find(name);
        if (it == frame.variables.end()) reportError("No such member in record: {}", name);
        return it->second;
    }

    virtual void onInitialize(AssemblyContext &ctx) const {
        ctx.generate("mov rdi, {}", count * 8);
        ctx.generate("lea rax, malloc[rip]");
        ctx.generate("call builtin$callsysv");
        ctx.generate("mov {}, rax", REG_FRAME_BASE);
        ctx.generate("mov qword ptr [{}], {}", REG_LEFT_VALUE_POINTER, REG_FRAME_BASE);
        frame.onInitialize(ctx);
    }

    virtual void onAssign(AssemblyContext &ctx) const {
        ctx.generate("mov {}, qword ptr [{}]", REG_FRAME_BASE, REG_LEFT_VALUE_POINTER); // Load the left record's frame address
        for (auto [name, var] : frame.variables) {
            var->onLoadPointerToRegister(ctx);

            ctx.generate("push {}", REG_FRAME_BASE); // Save the right record's frame address
            ctx.generate("mov {}, qword ptr [rsp + 8]", REG_FRAME_BASE); // Load the right value record's frame address
            
            var->onLoadToStack(ctx);
            var->type->onAssign(ctx);

            ctx.generate("pop {}", REG_FRAME_BASE);
        }
        ctx.generate("add rsp, 8");
    }

    virtual bool needFinalize() const { return true; }
    virtual void onFinalize(AssemblyContext &ctx) const {
        if (frame.needFinalize()) {
            ctx.generate("push {}", REG_FRAME_BASE);
            ctx.generate("push qword ptr [{}]", REG_LEFT_VALUE_POINTER);
            ctx.generate("mov {}, qword ptr [{}]", REG_FRAME_BASE, REG_LEFT_VALUE_POINTER);
            for (auto [name, var] : frame.variables) {
                var->onFinalize(ctx);
            }
            ctx.generate("pop qword ptr [{}]", REG_LEFT_VALUE_POINTER);
            ctx.generate("pop {}", REG_FRAME_BASE);
        }
        ctx.generate("mov rdi, qword ptr [{}]", REG_LEFT_VALUE_POINTER);
        ctx.generate("lea rax, free[rip]");
        ctx.generate("call builtin$callsysv");
    }

    virtual std::string getSignature() const {
        std::string result = "record (";
        for (auto [name, var] : frame.variables) {
            result += name + ": " + var->type->getSignature() + ", ";
        }
        result.pop_back();
        result.pop_back();
        return result + ")";
    }
};

class TypeArray : public Type {
    size_t count;

public:
    std::vector<std::pair<int, int>> bounds;
    std::shared_ptr<Type> memberType;

    TypeArray(std::vector<std::pair<int, int>> bounds, std::shared_ptr<Type> memberType) : bounds(bounds), memberType(memberType) {
        count = 1;
        for (auto [min, max] : bounds) count *= max - min + 1;
    }

    void onCalculateMemberOffset(AssemblyContext &ctx) const {
        size_t remainDimsCount = count, i = 0;
        ctx.generate("xor rax, rax");
        for (auto [min, max] : bounds) {
            ctx.generate("push {}", min);
            ctx.generate("push {}", max);
            ctx.generate("push {}", ++i);
            ctx.generate("call builtin$checkarrayindex");
            ctx.generate("add rsp, 24");

            remainDimsCount /= max - min + 1;
            ctx.generate("mov rdx, {}", remainDimsCount);
            ctx.generate("pop rcx"); // Load the index
            ctx.generate("sub rcx, {}", min);
            ctx.generate("imul rdx, rcx");
            ctx.generate("add rax, rdx");
        }
    }

    void onLoadMemberPointerToRegister(AssemblyContext &ctx) const {
        onCalculateMemberOffset(ctx);
        ctx.generate("lea {}, qword ptr [{} + rax * 8]", REG_LEFT_VALUE_POINTER, REG_FRAME_BASE);
    }

    virtual void onInitialize(AssemblyContext &ctx) const {
        ctx.generate("mov rdi, {}", count * 8);
        ctx.generate("mov rbx, rax");
        ctx.generate("lea rax, malloc[rip]");
        ctx.generate("call builtin$callsysv");
        ctx.generate("mov {}, rax", REG_FRAME_BASE);
        ctx.generate("mov qword ptr [{}], rax", REG_LEFT_VALUE_POINTER);
        
        AssemblyContext ctxEndLoop("ArrayInitializeLoopEnd");
        ctxEndLoop.generate("add rsp, 8");

        ctx.generate("push 0");

        AssemblyContext ctxLoop("ArrayInitializeLoop");
        ctxLoop.generate("cmp qword ptr [rsp], {}", count);
        ctxLoop.generate("je {}", ctxEndLoop.getLabel());

        ctxLoop.generate("mov rax, qword ptr [rsp]");
        ctxLoop.generate("lea {}, qword ptr [{} + rax * 8]", REG_LEFT_VALUE_POINTER, REG_FRAME_BASE);
        ctxLoop.generate("push {}", REG_FRAME_BASE);
        memberType->onInitialize(ctxLoop);
        ctxLoop.generate("pop {}", REG_FRAME_BASE);
        ctxLoop.generate("inc qword ptr [rsp]");
        ctxLoop.generate("jmp {}", ctxLoop.getLabel());

        ctx.append(std::move(ctxLoop));
        ctx.append(std::move(ctxEndLoop));
    }

    virtual void onAssign(AssemblyContext &ctx) const {
        ctx.generate("mov {}, qword ptr [{}]", REG_FRAME_BASE, REG_LEFT_VALUE_POINTER); // Load the left array's frame address

        AssemblyContext ctxEndLoop("ArrayAssignLoopEnd");
        ctxEndLoop.generate("add rsp, 8");

        ctx.generate("push 0");

        AssemblyContext ctxLoop("ArrayAssignLoop");
        ctxLoop.generate("cmp qword ptr [rsp], {}", count);
        ctxLoop.generate("je {}", ctxEndLoop.getLabel());

        ctxLoop.generate("mov rax, qword ptr [rsp]");
        ctxLoop.generate("lea {}, qword ptr [{} + rax * 8]", REG_LEFT_VALUE_POINTER, REG_FRAME_BASE); // Load left member
        ctxLoop.generate("mov rcx, qword ptr [rsp + 8]");
        ctxLoop.generate("mov rax, qword ptr [rcx + rax * 8]", REG_FRAME_BASE); // Load right member

        ctxLoop.generate("push {}", REG_FRAME_BASE);

        ctxLoop.generate("push rax");
        memberType->onAssign(ctxLoop);

        ctxLoop.generate("pop {}", REG_FRAME_BASE);
        ctxLoop.generate("inc qword ptr [rsp]");
        ctxLoop.generate("jmp {}", ctxLoop.getLabel());

        ctx.append(std::move(ctxLoop));
        ctx.append(std::move(ctxEndLoop));

        ctx.generate("add rsp, 8");
    }

    virtual bool needFinalize() const { return true; }
    virtual void onFinalize(AssemblyContext &ctx) const {
        if (memberType->needFinalize()) {
            ctx.generate("push rbx");
            ctx.generate("push qword ptr [{}]", REG_LEFT_VALUE_POINTER);
            ctx.generate("mov rbx, qword ptr [{}]", REG_LEFT_VALUE_POINTER);

            AssemblyContext ctxEndLoop("ArrayFinalizeLoopEnd");
            ctxEndLoop.generate("add rsp, 8");

            ctx.generate("push 0");

            AssemblyContext ctxLoop("ArrayFinalizeLoop");
            ctxLoop.generate("cmp qword ptr [rsp], {}", count);
            ctxLoop.generate("je {}", ctxEndLoop.getLabel());

            ctxLoop.generate("mov rax, qword ptr [rsp]");
            ctxLoop.generate("lea {}, qword ptr [{} + rax * 8]", REG_LEFT_VALUE_POINTER, REG_FRAME_BASE);
            ctxLoop.generate("push {}", REG_FRAME_BASE);
            memberType->onFinalize(ctxLoop);
            ctxLoop.generate("pop {}", REG_FRAME_BASE);
            ctxLoop.generate("inc qword ptr [rsp]");
            ctxLoop.generate("jmp {}", ctxLoop.getLabel());

            ctx.append(std::move(ctxLoop));
            ctx.append(std::move(ctxEndLoop));

            ctx.generate("pop qword ptr [{}]", REG_LEFT_VALUE_POINTER);
            ctx.generate("pop rbx");
        }
        ctx.generate("mov rdi, qword ptr [{}]", REG_LEFT_VALUE_POINTER);
        ctx.generate("lea rax, free[rip]");
        ctx.generate("call builtin$callsysv");
    }

    virtual std::string getSignature() const {
        std::string result = "array (";
        for (auto [min, max] : bounds) {
            result += std::to_string(min) + ".." + std::to_string(max) + ", ";
        }
        result.pop_back();
        result.pop_back();
        return result + ") of " + memberType->getSignature();
    }
};

std::vector<class Block *> blocks;

class Function : public Symbol {
public:
    std::string name;
    std::vector<std::tuple<std::string, bool, std::shared_ptr<Type>>> parameters;
    std::shared_ptr<Type> returnType;
    std::shared_ptr<class Block> block;
    bool isBuiltinFunction;
    size_t level;
    std::string label;

    // For user-defined functions
    Function() {}
    void init(std::shared_ptr<Function> sharedThis, std::shared_ptr<AST::Callable> astCallable, class Block *parentBlock);

    // For builtin-functions
    Function(const std::string &name, std::vector<std::tuple<bool, std::shared_ptr<Type>>> parameters, std::shared_ptr<Type> returnType)
    : name(name), returnType(returnType), isBuiltinFunction(true) {
        for (auto [byReference, param] : parameters) this->parameters.push_back({"", byReference, param});
    }
};

std::vector<std::shared_ptr<Function>> builtinFunctions = {
    std::make_shared<Function>(
        "read",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {true, builtinTypeInteger}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "write",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeInteger}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "writeln",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeInteger}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "readf",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {true, builtinTypeDouble}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "writef",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeDouble}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "writefln",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeDouble}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "reads",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {true, builtinTypeString}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "readsln",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {true, builtinTypeString}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "writes",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeString}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "writesln",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeString}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "strlen",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeString}
        },
        builtinTypeInteger
    ),
    std::make_shared<Function>(
        "strcat",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeString},
            {false, builtinTypeString},
            {true, builtinTypeString}
        },
        nullptr
    ),
    std::make_shared<Function>(
        "getchr",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeString},
            {false, builtinTypeInteger}
        },
        builtinTypeInteger
    ),
    std::make_shared<Function>(
        "setchr",
        std::vector<std::tuple<bool, std::shared_ptr<Type>>>{
            {false, builtinTypeString},
            {false, builtinTypeInteger},
            {false, builtinTypeInteger}
        },
        nullptr
    )
};

AssemblyContext constsContext("Constants");

class Block {
public:
    std::shared_ptr<Function> function;
    std::map<std::string, std::shared_ptr<Symbol>> symbolTable;
    std::map<std::string, std::shared_ptr<Type>> typeAliases;
    Frame frame;
    Block *parentBlock;
    size_t level;
    std::string label;
    AssemblyContext ctx;

    Block(std::shared_ptr<Function> function, Block *parentBlock, std::shared_ptr<AST::Block> astBlock)
    : function(function),
      typeAliases(parentBlock ? parentBlock->typeAliases : builtinTypes),
      parentBlock(parentBlock),
      level(parentBlock ? parentBlock->level + 1 : 0),
      ctx("Function") {
        if (!parentBlock) {
            // Add all built-in functions to the root block
            for (auto func : builtinFunctions) symbolTable[func->name] = func;
        }

        for (auto astTypeAlias : astBlock->typeAliases) {
            typeAliases[astTypeAlias->name] = resolveAstType(astTypeAlias->type);
        }

        for (auto astConstant : astBlock->constants) {
            auto constant = std::make_shared<Constant>(astConstant->value);
            constant->generate(constsContext);
            symbolTable[astConstant->name] = constant;
        }

        size_t i = 0;
        for (auto astVariable : astBlock->variables) {
            auto variable = std::make_shared<Variable>(resolveAstType(astVariable->type), --i);
            symbolTable[astVariable->name] = variable;
            frame.variables[astVariable->name] = variable;
        }

        if (function) {
            ssize_t i = 0, nParams = function->parameters.size();
            for (auto [name, isReference, type] : function->parameters) {
                auto parameter = std::make_shared<Variable>(type, (nParams + 1) - i++, isReference);
                symbolTable[name] = parameter;
            }
        }

        for (auto astCallable : astBlock->callables) {
            auto func = std::make_shared<Function>();
            func->init(func, astCallable, this);
            symbolTable[astCallable->name] = func;
        }

        // Generate code
        ctx.generate("push rbp");
        ctx.generate("mov rbp, rsp");
        ctx.generate("sub rsp, {}", astBlock->variables.size() * 8);

        label = ctx.getLabel();
        if (function) function->label = label;

        loadFrame(ctx, level);
        frame.onInitialize(ctx);
        ctx.append(generateStatement(astBlock->statement));
        if (frame.needFinalize()) {
            loadFrame(ctx, level);
            frame.onFinalize(ctx);
        }

        ctx.generate("leave");
        ctx.generate("ret");

        blocks.push_back(this);
    }

    std::shared_ptr<Type> resolveAstType(std::shared_ptr<AST::Type> astType) {
        if (auto astRecordType = std::dynamic_pointer_cast<AST::RecordType>(astType)) {
            std::map<std::string, std::shared_ptr<Variable>> variables;
            size_t i = 0;
            for (auto astVariable : astRecordType->variables) {
                if (variables.find(astVariable->name) != variables.end()) {
                    reportError("Duplicated variable name in record: {}", astVariable->name);
                }
                variables[astVariable->name] = std::make_shared<Variable>(resolveAstType(astVariable->type), i++);
            }
            return std::make_shared<TypeRecord>(variables);
        } else if (auto astTypeIdentifier = std::dynamic_pointer_cast<AST::TypeIdentifier>(astType)) {
            return resolveTypeName(astTypeIdentifier->name);
        } else if (auto astArraySchema = std::dynamic_pointer_cast<AST::ArraySchema>(astType)) {
            std::vector<std::pair<int, int>> bounds;
            for (auto astBounds : astArraySchema->bounds) {
                int min = std::stoi(astBounds->min);
                int max = std::stoi(astBounds->max);
                if (min > max) reportError("Invalid array bound [{}..{}]", astBounds->min, astBounds->max);
                bounds.push_back({min, max});
            }
            return std::make_shared<TypeArray>(bounds, resolveTypeName(astArraySchema->memberType));
        } else if (auto astPointerType = std::dynamic_pointer_cast<AST::PointerType>(astType)) {
            return std::make_shared<TypePointer>(resolveAstType(astPointerType->baseType));
        } else {
            reportError("Bug!");
        }
    }

    std::shared_ptr<Type> resolveTypeName(const std::string &typeName) const {
        if (auto it = typeAliases.find(typeName); it != typeAliases.end()) return it->second;
        reportError("Type name not found: {}", typeName);
    }

    // [level, symbol]
    std::pair<size_t, std::shared_ptr<Symbol>> resolveSymbol(const std::string &symbolName) const {
        if (function && symbolName == function->name) return {level - 1, function};
        if (auto it = symbolTable.find(symbolName); it != symbolTable.end()) return {level, it->second};
        if (parentBlock) return parentBlock->resolveSymbol(symbolName);
        reportError("Can't resolve symbol: {}", symbolName);
    }

    void loadFrame(AssemblyContext &ctx, size_t level) {
        if (level == this->level) {
            ctx.generate("mov {}, rbp", REG_FRAME_BASE);
        } else {
            ctx.generate("mov rax, {}", this->level + this->function->parameters.size() + 1 - level);
            ctx.generate("mov {}, qword ptr [rbp + rax * 8]", REG_FRAME_BASE);
        }
    }

    static bool checkNumberTypeIsDouble(std::shared_ptr<Type> type) {
        if (std::dynamic_pointer_cast<TypeDouble>(type)) return true;
        if (std::dynamic_pointer_cast<TypeInteger>(type)) return false;
        reportError("Expected a number type but got: {}", type->getSignature());
    }

    void ensureType(AssemblyContext &ctx, std::shared_ptr<Type> originalType, std::shared_ptr<Type> targetType) {
        if (auto target = std::dynamic_pointer_cast<TypeInteger>(targetType)) {
            if (checkNumberTypeIsDouble(originalType)) {
                // Convert double to integer
                ctx.generate("cvttsd2si rax, qword ptr [rsp]");
                ctx.generate("mov qword ptr [rsp], rax");
            }
        } else if (auto target = std::dynamic_pointer_cast<TypeDouble>(targetType)) {
            if (!checkNumberTypeIsDouble(originalType)) {
                // Convert integer to double
                ctx.generate("cvtsi2sd xmm0, qword ptr [rsp]");
                ctx.generate("movsd qword ptr [rsp], xmm0");
            }
        } else {
            if (*originalType != *targetType)
                reportError("Couldn't convert {} to {}", originalType->getSignature(), targetType->getSignature());
        }
    }

    std::shared_ptr<Type> generateBinaryExpression(
        AssemblyContext &ctx,
        std::shared_ptr<AST::Expression> left,
        AST::BinaryOperator op,
        std::shared_ptr<AST::Expression> right
    ) {
        switch (op) {
            case AST::BinaryOperator::Equal:
            case AST::BinaryOperator::NotEqual:
            case AST::BinaryOperator::LessThan:
            case AST::BinaryOperator::GreaterThan:
            case AST::BinaryOperator::LessThanOrEqual:
            case AST::BinaryOperator::GreaterThanOrEqual:
            case AST::BinaryOperator::Plus:
            case AST::BinaryOperator::Minus:
            case AST::BinaryOperator::Times:
            case AST::BinaryOperator::Slash: {
                // Arithmetic operators: int op double = double
                // Generate in a new context
                AssemblyContext ctxL("BinaryOperatorLeftOperand"), ctxR("BinaryOperatorRightOperand");
                auto leftType = generateRightExpression(ctxL, left),
                     rightType = generateRightExpression(ctxR, right);

                bool leftIsDouble = checkNumberTypeIsDouble(leftType),
                     rightIsDouble = checkNumberTypeIsDouble(rightType),
                     useDouble = leftIsDouble || rightIsDouble || op == AST::BinaryOperator::Slash;

                if (useDouble && !leftIsDouble) {
                    ensureType(ctxL, builtinTypeInteger, builtinTypeDouble);
                }
                if (useDouble && !rightIsDouble) {
                    ensureType(ctxR, builtinTypeInteger, builtinTypeDouble);
                }

                ctx.append(std::move(ctxL));
                ctx.append(std::move(ctxR));

                if (useDouble) {
                    ctx.generate("pop rax"); // r
                    ctx.generate("movq xmm1, rax"); // r
                    ctx.generate("pop rax"); // l
                    ctx.generate("movq xmm0, rax"); // l

                    if (op >= AST::BinaryOperator::Plus) {
                        if (op == AST::BinaryOperator::Plus)
                            ctx.generate("addsd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::Minus)
                            ctx.generate("subsd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::Times)
                            ctx.generate("mulsd xmm0, xmm1");
                        else
                            ctx.generate("divsd xmm0, xmm1");
                        ctx.generate("movq rax, xmm0");
                        ctx.generate("push rax");
                        
                        return builtinTypeDouble;
                    } else {
                        if (op == AST::BinaryOperator::Equal)
                            ctx.generate("cmpeqsd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::NotEqual)
                            ctx.generate("cmpneqsd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::LessThan)
                            ctx.generate("cmpltsd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::GreaterThan)
                            ctx.generate("cmpnlesd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::LessThanOrEqual)
                            ctx.generate("cmplesd xmm0, xmm1");
                        else if (op == AST::BinaryOperator::GreaterThanOrEqual)
                            ctx.generate("cmpnltsd xmm0, xmm1");
                        ctx.generate("movq rax, xmm0");
                        ctx.generate("and rax, 1");
                        ctx.generate("push rax");

                        return builtinTypeInteger;
                    }
                } else {
                    ctx.generate("pop rsi"); // r
                    if (op >= AST::BinaryOperator::Plus) {
                        if (op == AST::BinaryOperator::Plus)
                            ctx.generate("add qword ptr [rsp], rsi");
                        else if (op == AST::BinaryOperator::Minus)
                            ctx.generate("sub qword ptr [rsp], rsi");
                        else {
                            ctx.generate("imul rsi, qword ptr [rsp]");
                            ctx.generate("mov qword ptr [rsp], rsi");
                        }
                    } else {
                        ctx.generate("xor rax, rax");
                        ctx.generate("cmp qword ptr [rsp], rsi");
                        if (op == AST::BinaryOperator::Equal)
                            ctx.generate("sete al");
                        else if (op == AST::BinaryOperator::NotEqual)
                            ctx.generate("setne al");
                        else if (op == AST::BinaryOperator::LessThan)
                            ctx.generate("setl al");
                        else if (op == AST::BinaryOperator::GreaterThan)
                            ctx.generate("setg al");
                        else if (op == AST::BinaryOperator::LessThanOrEqual)
                            ctx.generate("setle al");
                        else if (op == AST::BinaryOperator::GreaterThanOrEqual)
                            ctx.generate("setge al");
                        ctx.generate("mov qword ptr [rsp], rax");
                    }

                    return builtinTypeInteger;
                }
            }
            case AST::BinaryOperator::Div:
            case AST::BinaryOperator::Mod:
            case AST::BinaryOperator::Or:
            case AST::BinaryOperator::Xor:
            case AST::BinaryOperator::And:
            case AST::BinaryOperator::LeftShift:
            case AST::BinaryOperator::RightShift: {
                // int op int = int
                ensureType(ctx, generateRightExpression(ctx, left), builtinTypeInteger);
                ensureType(ctx, generateRightExpression(ctx, right), builtinTypeInteger);
                ctx.generate("pop rcx"); // r
                ctx.generate("pop rax"); // l

                if (op == AST::BinaryOperator::Div) {
                    ctx.generate("cqo");
                    ctx.generate("idiv rcx");
                } else if (op == AST::BinaryOperator::Mod) {
                    ctx.generate("cqo");
                    ctx.generate("idiv rcx");
                    ctx.generate("mov rax, rdx");
                } else if (op == AST::BinaryOperator::Or)
                    ctx.generate("or rax, rcx");
                else if (op == AST::BinaryOperator::Xor)
                    ctx.generate("xor rax, rcx");
                else if (op == AST::BinaryOperator::And)
                    ctx.generate("and rax, rcx");
                else if (op == AST::BinaryOperator::LeftShift)
                    ctx.generate("shl rax, cl");
                else
                    ctx.generate("shr rax, cl");

                ctx.generate("push rax");

                return builtinTypeInteger;
            }
            default:
                reportError("Bug!");
        }
    }

    std::shared_ptr<Type> generateFunctionCall(AssemblyContext &ctx, std::shared_ptr<Function> function, std::list<std::shared_ptr<AST::Expression>> astArguments) {
        if (function->parameters.size() != astArguments.size())
            reportError("Arguments count mismatch in function call to {}: expected {} but got {}", function->name, function->parameters.size(), astArguments.size());
        for (size_t i = 0; i < (function->isBuiltinFunction ? 0 : function->level); i++) {
            loadFrame(ctx, i);
            ctx.generate("push {}", REG_FRAME_BASE);
        }

        size_t i = 0;
        for (auto astArgument : astArguments) {
            auto [name, byReference, type] = function->parameters[i++];
            if (byReference) {
                if (auto astMaybeLeftValueArgument = std::dynamic_pointer_cast<AST::MaybeLeftValueExpression>(astArgument)) {
                    auto exprType = generateLeftExpression(ctx, astMaybeLeftValueArgument);
                    if (exprType != type)
                        reportError("Couldn't bind a value with type {} to a reference parameter with type {}", exprType->getSignature(), type->getSignature());
                    ctx.generate("push {}", REG_LEFT_VALUE_POINTER);
                } else
                    reportError("Couldn't bind a right value to a reference parameter");
            } else
                ensureType(ctx, generateRightExpression(ctx, astArgument), type);
        }
        ctx.generate("call {}", function->isBuiltinFunction ? "builtin$" + function->name : function->label);
        ctx.generate("add rsp, {}", ((function->isBuiltinFunction ? 0 : function->level) + function->parameters.size()) * 8);
        ctx.generate("push {}", REG_RETURN_VALUE);
        return function->returnType;
    }

    std::shared_ptr<Type> generateLeftExpression(AssemblyContext &ctx, std::shared_ptr<AST::MaybeLeftValueExpression> expr) {
        // IdentifierExpression
        // RecordAccessExpression
        // ArrayAccessExpression
        // PointerAccessExpression
        if (auto ex = std::dynamic_pointer_cast<AST::IdentifierExpression>(expr)) {
            // "generateRightExpression()" won't reach here.
            auto [slevel, sym] = resolveSymbol(ex->identifier);
            if (auto var = std::dynamic_pointer_cast<Variable>(sym)) {
                loadFrame(ctx, slevel);
                var->onLoadPointerToRegister(ctx);
                if (var->isReference) {
                    ctx.generate("mov {}, qword ptr [{}]", REG_LEFT_VALUE_POINTER, REG_LEFT_VALUE_POINTER);
                }
                return var->type;
            } else {
                reportError("Symbol is not a variable: {}", ex->identifier);
            }
        } else if (auto ex = std::dynamic_pointer_cast<AST::RecordAccessExpression>(expr)) {
            auto type = std::dynamic_pointer_cast<TypeRecord>(generateLeftExpression(ctx, ex->record));
            if (!type) reportError("Attempt to access a non-record lvalue's member: {}", ex->member);

            auto member = type->resolveMember(ex->member);
            ctx.generate("mov {}, qword ptr [{}]", REG_FRAME_BASE, REG_LEFT_VALUE_POINTER);
            member->onLoadPointerToRegister(ctx);
            return member->type;
        } else if (auto ex = std::dynamic_pointer_cast<AST::ArrayAccessExpression>(expr)) {
            AssemblyContext actx("ArrayAccessExpressionArrayEvaluation");
            auto type = std::dynamic_pointer_cast<TypeArray>(generateLeftExpression(actx, ex->array));
            if (!type) reportError("Attempt to access a non-array lvalue's member");

            if (type->bounds.size() != ex->indexes.size())
                reportError("Array subscription dimensions mismatch: expected {} but got {}", type->bounds.size(), ex->indexes.size());

            // The indexes are pushed to the stack in the reversed order
            // Calculate the indexes first
            for (auto it = ex->indexes.rbegin(); it != ex->indexes.rend(); it++) {
                if (!std::dynamic_pointer_cast<TypeInteger>(generateRightExpression(ctx, *it)))
                    reportError("Non-integer type used in array subscription");
            }

            // Calculate the array pointer then
            ctx.append(std::move(actx));

            ctx.generate("mov {}, qword ptr [{}]", REG_FRAME_BASE, REG_LEFT_VALUE_POINTER);
            type->onLoadMemberPointerToRegister(ctx);

            return type->memberType;
        } else if (auto ex = std::dynamic_pointer_cast<AST::PointerAccessExpression>(expr)) {
            auto type = std::dynamic_pointer_cast<TypePointer>(generateRightExpression(ctx, ex->pointer));
            if (!type) reportError("Attempt to dereference a non-pointer value");

            ctx.generate("pop {}", REG_LEFT_VALUE_POINTER);
            return type->valueType;
        } else reportError("Bug!");
    }

    std::shared_ptr<Type> generateRightExpression(AssemblyContext &ctx, std::shared_ptr<AST::Expression> expr) {
        // MaybeLeftValueExpression
        // ConstantExpression
        // BinaryOperatorExpression
        // UnaryOperatorExpression
        // CallExpressionWithArguments
        if (auto ex = std::dynamic_pointer_cast<AST::IdentifierExpression>(expr)) {
            auto [slevel, sym] = resolveSymbol(ex->identifier);
            if (auto var = std::dynamic_pointer_cast<Variable>(sym)) {
                loadFrame(ctx, slevel);
                var->onLoadToStack(ctx);
                if (var->isReference) {
                    ctx.generate("pop rax");
                    ctx.generate("push qword ptr [rax]");
                }
                return var->type;
            } else if (auto cst = std::dynamic_pointer_cast<Constant>(sym)) {
                cst->onLoadToStack(ctx);
                return cst->type;
            } else if (auto func = std::dynamic_pointer_cast<Function>(sym)) {
                return generateFunctionCall(ctx, func, {});
            } else reportError("Bug!");
        } if (auto ex = std::dynamic_pointer_cast<AST::MaybeLeftValueExpression>(expr)) {
            auto type = generateLeftExpression(ctx, ex);
            ctx.generate("push qword ptr [{}]", REG_LEFT_VALUE_POINTER);
            return type;
        } else if (auto ex = std::dynamic_pointer_cast<AST::ConstantExpression>(expr)) {
            auto constant = std::make_shared<Constant>(ex->value);
            constant->generate(constsContext);
            constant->onLoadToStack(ctx);
            return constant->type;
        } else if (auto ex = std::dynamic_pointer_cast<AST::BinaryOperatorExpression>(expr)) {
            return generateBinaryExpression(ctx, ex->leftOperand, ex->op, ex->rightOperand);
        } else if (auto ex = std::dynamic_pointer_cast<AST::UnaryOperatorExpression>(expr)) {
            if (ex->op == AST::UnaryOperator::Not) {
                auto type = generateRightExpression(ctx, ex->operand);
                if (!std::dynamic_pointer_cast<TypeInteger>(type))
                    reportError("Unary operator NOT applied on a non-integer value");
                ctx.generate("xor rcx, rcx");
                ctx.generate("pop rax");
                ctx.generate("test rax, rax");
                ctx.generate("setz cl");
                ctx.generate("push rcx");
                return type;
            } else if (ex->op == AST::UnaryOperator::Plus) {
                auto type = generateRightExpression(ctx, ex->operand);
                if (checkNumberTypeIsDouble(type)) {
                    // do nothing
                }
                return type;
            } else if (ex->op == AST::UnaryOperator::Minus) {
                auto type = generateRightExpression(ctx, ex->operand);
                if (checkNumberTypeIsDouble(type)) {
                    ctx.generate("xor rax, rax");
                    ctx.generate("movsd xmm0, rax");
                    ctx.generate("subsd xmm0, qword ptr [rsp]");
                    ctx.generate("movsd qword ptr [rsp], xmm0");
                } else
                    ctx.generate("neg qword ptr [rsp]");
                return type;
            } else if (ex->op == AST::UnaryOperator::At) {
                auto le = std::dynamic_pointer_cast<AST::MaybeLeftValueExpression>(ex->operand);
                if (!le)
                    reportError("Unary operator AT applied on a non-left value");

                auto type = generateLeftExpression(ctx, le);
                ctx.generate("push {}", REG_LEFT_VALUE_POINTER);
                return std::make_shared<TypePointer>(type);
            } else reportError("Bug!");
        } else if (auto ex = std::dynamic_pointer_cast<AST::CallExpressionWithArguments>(expr)) {
            auto [slevel, sym] = resolveSymbol(ex->functionName);
            auto func = std::dynamic_pointer_cast<Function>(sym);
            if (!func) reportError("No such function: {}", ex->functionName);
            return generateFunctionCall(ctx, func, ex->argumentList);
        } else reportError("Bug!");
    }

    AssemblyContext generateStatement(std::shared_ptr<AST::Statement> stmt = nullptr) {
        // AssignmentStatement
        // ExplicitCallStatement
        // CompoundStatement
        // WhileStatement
        // RepeatStatement
        // ForStatement
        // IfStatement
        // ExpressionStatement
        // EmptyStatement
        AssemblyContext ctx(stmt ? "Statement" : "NullStatement");
        if (auto st = std::dynamic_pointer_cast<AST::AssignmentStatement>(stmt)) {
            auto rightType = generateRightExpression(ctx, st->right);

            if (auto lv = std::dynamic_pointer_cast<AST::IdentifierExpression>(st->left); lv && function && lv->identifier == function->name) {
                // return value assignment
                ensureType(ctx, rightType, function->returnType);
                ctx.generate("pop {}", REG_RETURN_VALUE);
            } else {
                auto leftType = generateLeftExpression(ctx, st->left);
                ensureType(ctx, rightType, leftType);
                leftType->onAssign(ctx);
            }
        } else if (auto st = std::dynamic_pointer_cast<AST::ExplicitCallStatement>(stmt)) {
            auto [slevel, sym] = resolveSymbol(st->functionName);
            auto func = std::dynamic_pointer_cast<Function>(sym);
            if (!func) reportError("No such function: {}", st->functionName);
            generateFunctionCall(ctx, func, {});
            ctx.generate("add rsp, 8"); // ignore return value
        } else if (auto st = std::dynamic_pointer_cast<AST::CompoundStatement>(stmt)) {
            for (auto sub : st->statements) {
                ctx.append(generateStatement(sub));
            }
        } else if (auto st = std::dynamic_pointer_cast<AST::WhileStatement>(stmt)) {
            if (!std::dynamic_pointer_cast<TypeInteger>(generateRightExpression(ctx, st->condition)))
                reportError("While's condition is not integer type");

            auto ctxExitLoop = generateStatement();
            ctx.generate("pop rax");
            ctx.generate("test rax, rax");
            ctx.generate("jz {}", ctxExitLoop.getLabel());

            ctx.append(generateStatement(st->statement));

            ctx.generate("jmp {}", ctx.getLabel());
            ctx.append(std::move(ctxExitLoop));
        } else if (auto st = std::dynamic_pointer_cast<AST::RepeatStatement>(stmt)) {
            ctx.append(generateStatement(st->statement));

            if (!std::dynamic_pointer_cast<TypeInteger>(generateRightExpression(ctx, st->condition)))
                reportError("Repeat's condition is not integer type");
            ctx.generate("pop rax");
            ctx.generate("test rax, rax");
            ctx.generate("jz {}", ctx.getLabel());
        } else if (auto st = std::dynamic_pointer_cast<AST::ForStatement>(stmt)) {
            auto [slevel, sym] = resolveSymbol(st->variable);
            auto var = std::dynamic_pointer_cast<Variable>(sym);
            if (!var)
                reportError("For's variable is not a variable");
            if (!std::dynamic_pointer_cast<TypeInteger>(var->type))
                reportError("For's variable is not integer type");

            auto initialValueType = generateRightExpression(ctx, st->initialValue);
            ensureType(ctx, initialValueType, var->type);

            loadFrame(ctx, slevel);
            var->onLoadPointerToRegister(ctx);
            var->type->onAssign(ctx);

            auto finalValueType = generateRightExpression(ctx, st->finalValue);

            AssemblyContext ctxExitLoop("ForLoopExit");
            ctxExitLoop.generate("add rsp, 8"); // pop final value

            AssemblyContext ctxLoop("ForLoop");
            loadFrame(ctxLoop, slevel);
            var->onLoadToStack(ctxLoop);
            ctxLoop.generate("pop rsi"); // i
            ctxLoop.generate("cmp rsi, qword ptr [rsp]"); // i <=> final
            if (st->direction == AST::ForStatement::Direction::Up)
                ctxLoop.generate("jg {}", ctxExitLoop.getLabel());
            else
                ctxLoop.generate("jl {}", ctxExitLoop.getLabel());
            
            ctxLoop.append(generateStatement(st->statement));

            // Modify the loop variable
            loadFrame(ctxLoop, slevel);
            var->onLoadPointerToRegister(ctxLoop);
            if (st->direction == AST::ForStatement::Direction::Up)
                ctxLoop.generate("inc qword ptr [{}]", REG_LEFT_VALUE_POINTER);
            else
                ctxLoop.generate("dec qword ptr [{}]", REG_LEFT_VALUE_POINTER);

            ctxLoop.generate("jmp {}", ctxLoop.getLabel());

            ctx.append(std::move(ctxLoop));
            ctx.append(std::move(ctxExitLoop));
        } else if (auto st = std::dynamic_pointer_cast<AST::IfStatement>(stmt)) {
            if (!std::dynamic_pointer_cast<TypeInteger>(generateRightExpression(ctx, st->condition)))
                reportError("If's condition is not integer type");

            auto ctxTrue = generateStatement(st->statementForTrue);
            auto ctxFalse = generateStatement(st->statementForFalse);
            auto ctxExit = generateStatement();

            ctx.generate("pop rax");
            ctx.generate("test rax, rax");
            ctx.generate("jz {}", ctxFalse.getLabel());

            ctx.append(std::move(ctxTrue));
            ctx.generate("jmp {}", ctxExit.getLabel());
            ctx.append(std::move(ctxFalse));
            ctx.append(std::move(ctxExit));
        } else if (auto st = std::dynamic_pointer_cast<AST::ExpressionStatement>(stmt)) {
            generateRightExpression(ctx, st->expression);
            ctx.generate("add rsp, 8"); // ignore expression value
        } else {
            ctx.generate("nop");
        }

        return ctx;
    }
};

void Function::init(std::shared_ptr<Function> sharedThis, std::shared_ptr<AST::Callable> astCallable, class Block *parentBlock) {
    level = parentBlock->level + 1;

    for (auto astParameter : astCallable->parameters) {
        auto type = parentBlock->resolveAstType(astParameter->type);
        if (!astParameter->passByReference && !type->allowedPassByValue())
            reportError("Parameter type {} is not allowed to be passed by value", type->getSignature());
        parameters.push_back({astParameter->name, astParameter->passByReference, type});
    }

    if (!astCallable->returnType.empty()) {
        returnType = parentBlock->resolveTypeName(astCallable->returnType);
        if (!returnType->allowedPassByValue())
            reportError("Return type {} is not allowed to be passed by value", returnType->getSignature());
    }
    
    name = astCallable->name;
    isBuiltinFunction = false;
    block = std::make_shared<Block>(sharedThis, parentBlock, astCallable->block);
}

std::string generateCode(std::shared_ptr<AST::Block> astRootBlock) {
    auto block = std::make_shared<Block>(nullptr, nullptr, astRootBlock);

    AssemblyContext ctx("TopLevel");
    ctx.append(std::move(constsContext));
    for (auto func : blocks) ctx.append(std::move(func->ctx));

    return ".intel_syntax noprefix\n"
           ".text\n"
         + ctx.getCode()
         + ".globl main\n"
           "main:\n"
           "    push rbp\n"
           "    mov rbp, rsp\n"
           "    call " + block->label + "\n"
           "    xor rax, rax\n"
           "    leave\n"
           "    ret\n";
}

}

#endif // _MENCI_CODEGEN_H
