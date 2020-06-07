#ifndef _MENCI_AST_PRINT_H
#define _MENCI_AST_PRINT_H

#include <ostream>
#include <memory>
#include <list>
#include <type_traits>

#include "terminalcolor.h"

#ifdef __GNUC__
#include <cxxabi.h>
#define getClassName(type) (abi::__cxa_demangle(typeid(type).name(), 0, 0, nullptr))
#else
#define getClassName(type) (typeid(type).name())
#endif

template <typename S, typename T>
class is_streamable {
    template <typename SS, typename TT>
    static auto test(int) -> decltype(std::declval<SS &>() << std::declval<TT>(), std::true_type());

    template <typename, typename>
    static auto test(...) -> std::false_type;

public:
    static const bool value = decltype(test<S, T>(0))::value;
};

template <typename Test, template<typename...> class Ref>
struct is_specialization : std::false_type {};

template <template <typename...> class Ref, typename... Args>
struct is_specialization<Ref<Args...>, Ref> : std::true_type {};

template <typename T>
class NamedPrintable;

class PrintStream {
public:
    std::ostream &stream;
    size_t indentLevel = 0;

    void increaseIndent() { indentLevel++; }
    void decreaseIndent() { indentLevel--; }

    std::string getIndent() const {
        constexpr size_t INDENT_WIDTH = 2;
        return std::string(indentLevel * INDENT_WIDTH, ' ');
    }

    PrintStream(std::ostream &stream) : stream(stream) {}

    template <typename T>
    PrintStream &operator<<(const NamedPrintable<T> &field) {
        field.print(*this);
        return *this;
    }

    template <typename T>
    void print(const T &printable) {
        stream << TerminalColor::ForegroundBlue << TerminalColor::Bold
               << "[" << getClassName(*printable) << "]"
               << TerminalColor::Reset
               << std::endl;
        printable->printTo(*this);
    }
};

class Printable {
public:
    virtual ~Printable() = default;
    virtual void printTo(PrintStream &stream) const = 0;
};

template <typename T, typename std::enable_if_t<is_streamable<std::ostream, T>::value && !is_specialization<std::decay_t<T>, std::shared_ptr>::value>* = nullptr>
void printNamedPrintable(const NamedPrintable<T> &np, PrintStream &stream) {
    stream.stream << np.printable << std::endl;
}

template <typename T, typename std::enable_if_t<is_specialization<std::decay_t<T>, std::shared_ptr>::value>* = nullptr>
void printNamedPrintable(const NamedPrintable<T> &np, PrintStream &stream) {
    stream.stream << TerminalColor::ForegroundBlue << TerminalColor::Bold
                  << "[" << getClassName(*np.printable) << "]"
                  << TerminalColor::Reset
                  << std::endl;
    stream.increaseIndent();
    np.printable->printTo(stream);
    stream.decreaseIndent();
}

template <typename T, typename std::enable_if_t<is_specialization<std::decay_t<T>, std::list>::value>* = nullptr>
void printNamedPrintable(const NamedPrintable<T> &np, PrintStream &stream) {
    if (np.printable.size() > 0) {
        stream.stream << std::endl;
        size_t i = 0;
        for (const auto &x : np.printable) {
            stream << NamedPrintable<decltype(x)>(++i, x);
        }
    } else {
        stream.stream << TerminalColor::ForegroundYellow
                      << "[empty array]"
                      << TerminalColor::Reset
                      << std::endl;
    }
}

template <typename T>
class NamedPrintable {
public:
    size_t index = 0;
    std::string name;
    const T &printable;

    NamedPrintable(size_t index, const T &printable) : index(index), printable(printable) {}
    NamedPrintable(const std::string &name, const T &printable) : name(name), printable(printable) {}

    void printName(PrintStream &stream) const {
        if (index) {
            stream.stream << stream.getIndent()
                          << TerminalColor::ForegroundYellow
                          << index << ": "
                          << TerminalColor::Reset;
        } else {
            stream.stream << stream.getIndent()
                          << TerminalColor::ForegroundGreen
                          << name << ": "
                          << TerminalColor::Reset;
        }
    }

    void print(PrintStream &stream) const {
        printName(stream);
        printNamedPrintable(*this, stream);
    }
};

#define PRINT(field) NamedPrintable<decltype(field)>(#field, field)

#endif // _MENCI_AST_PRINT_H
