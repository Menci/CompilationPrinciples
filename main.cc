#include <iostream>

#include "context.h"
#include "ast-print.h"
#include "codegen.h"

int main(int argc, char *argv[]) {
    Context ctx;
    for (int i = 1; i < argc; ++i) {
        if (argv[i] == std::string("-p")) {
            ctx.traceParsing = true;
        } else if (argv[i] == std::string("-s")) {
            ctx.traceScanning = true;
        } else {
            ctx.parse(argv[i]);

            if (ctx.traceParsing) {
                PrintStream stream(std::cerr);
                stream.print(ctx.program);
            }

            std::cout << CodeGen::generateCode(ctx.program->topLevelBlock);
        }
    }
}
