#include <iostream>

#include "context.h"
#include "ast-print.h"

int main(int argc, char *argv[]) {
  Context ctx;
  for (int i = 1; i < argc; ++i) {
    if (argv[i] == std::string("-p")) {
      ctx.traceParsing = true;
    } else if (argv[i] == std::string("-s")) {
      ctx.traceScanning = true;
    } else {
      ctx.parse(argv[i]);

      PrintStream stream(std::cout);
      stream.print(ctx.program);
    }
  }
}
