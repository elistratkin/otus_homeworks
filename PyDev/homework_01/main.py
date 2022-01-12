"""
Домашнее задание №1
Функции и структуры данных
"""


def power_numbers(*numbers, power=2):
    return [number ** power for number in numbers]


# filter types
ODD = "odd"
EVEN = "even"
PRIME = "prime"


def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True


def filter_numbers(my_list, fil):
    if fil == ODD:
        res = list(filter(lambda x: x % 2, my_list))
    if fil == EVEN:
        res = list(filter(lambda x: x % 2 == 0, my_list))
    if fil == PRIME:
        res = list(filter(lambda x: is_prime(x), my_list))
    return res