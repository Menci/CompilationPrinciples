#ifndef _MENCI_UTIL_H
#define _MENCI_UTIL_H

#include <vector>
#include <functional>

template <typename T>
std::vector<T> _merge(std::vector<T> &&v1, std::vector<T> &&v2) {
    std::vector<T> v = v1;
    v.reserve(v.size() + v2.size());
    for (auto &x : v2) v.push_back(std::move(x));
    return v;
}

template <typename T>
std::vector<T> _concat(std::vector<T> &&v1, T &&x) {
    std::vector<T> v = v1;
    v.push_back(x);
    return v;
}

template <typename T>
std::vector<T> _concat(T &&x, std::vector<T> &&v1) {
    std::vector<T> v;
    v.reserve(1 + v1.size());
    v.push_back(x);
    for (auto &y : v1) v.push_back(std::move(y));
    return v;
}

template <typename T1, typename F>
auto _map(std::vector<T1> &&v1, F f) {
    std::vector<decltype(f(v1[0]))> v;
    v.reserve(v1.size());
    for (auto &x : v1) v.push_back(f(std::move(x)));
    return v;
}

#define merge(a, b) _merge(std::move(a), std::move(b))
#define concat(a, b) _concat(std::move(a), std::move(b))
#define map(a, b) _map(std::move(a), b)

#endif // _MENCI_UTIL_H
