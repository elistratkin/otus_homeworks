from homework_02.exceptions import LowFuelError, NotEnoughFuel
from abc import ABC


class Vehicle(ABC):
    def __init__(self,
                 weight=2,
                 fuel=1,
                 fuel_consumption=1,
                 ):
        self.weight = weight
        self.fuel = fuel
        self.fuel_consumption = fuel_consumption
        self.started = False

    def start(self):
        if self.started:
            print('Готов')
        else:
            if self.fuel > 0:
                self.started = True
                print('Топлива достаточно')
            else:
                raise LowFuelError('Топлива недостаточно')

    def move(self, distance):
        amount_of_fuel = self.fuel_consumption * distance
        if amount_of_fuel <= self.fuel:
            self.fuel -= amount_of_fuel
            return f'Осталось {self.fuel} единиц топлива'
        else:
            raise NotEnoughFuel()
