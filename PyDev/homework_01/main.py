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

res_list = []


def is_prime(n):
    prime = True
    for i in range(2, n):
        if n % i == 0:
            prime = False
            break
    if prime:
        if n > 1:
            res_list.append(n)


def filter_numbers(my_list, fil):
    for x in my_list:
        if fil == "odd":
            if x % 2:
                res_list.append(x)
        if fil == "even":
            if x % 2 == 0:
                res_list.append(x)
        if fil == "prime":
            is_prime(x)
    return res_list
