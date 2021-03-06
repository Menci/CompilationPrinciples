#ifndef _MENCI_CONTEXT_H
#define _MENCI_CONTEXT_H

#include <string>
#include <stack>

#include "parser.hh"
#include "ast.h"

#define YY_DECL yy::parser::symbol_type yylex(Context &ctx)
YY_DECL;

class Context {
public:
    Context() {}

    bool parse(const std::string &f);
    std::string file;

    bool traceScanning = false;
    bool traceParsing = false;
    bool printReduceRule = false;

    // For scanner to open file
    void initializeScanner();

    yy::location location;

    std::shared_ptr<AST::Program> program;
    std::shared_ptr<AST::Block> currentBlock;
    std::stack<std::shared_ptr<AST::Block>> blockStack;
};

#endif // _MENCI_CONTEXT_H
