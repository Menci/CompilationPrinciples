#ifndef _MENCI_UTIL_H
#define _MENCI_UTIL_H

#include <list>
#include <functional>
#include <type_traits>

template <typename V1, typename V2, typename std::enable_if_t<std::is_same_v<std::decay_t<V1>, std::decay_t<V2>>> * = nullptr>
auto merge(V1 &&v1, V2 &&v2) {
    std::decay_t<V1> v = v1;
    v.splice(v.end(), v2);
    return v;
}

template <typename V, typename T, typename std::enable_if_t<std::is_same_v<std::list<std::decay_t<T>>, std::decay_t<V>>> * = nullptr>
auto concat(V &&v1, T &&x) {
    std::list<std::decay_t<T>> v = v1;
    v.push_back(x);
    return v;
}

template <typename V, typename T, typename std::enable_if_t<std::is_same_v<std::list<std::decay_t<T>>, std::decay_t<V>>> * = nullptr>
auto concat(T &&x, V &&v1) {
    std::list<std::decay_t<T>> v = v1;
    v.push_front(x);
    return v;
}

template <typename V, typename F>
auto map(V &&v1, F f) {
    std::list<decltype(f(v1.front()))> v;
    for (auto &x : v1) v.push_back(f(std::move(x)));
    return v;
}

#endif // _MENCI_UTIL_H
