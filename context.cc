#include "context.h"
#include "parser.hh"

bool Context::parse(const std::string &f) {
    file = f;
    location.initialize(&file);
    initializeScanner();

    yy::parser parser(*this);
    parser.set_debug_level(traceParsing);

    return parser() == 0;
}
