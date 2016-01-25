class MemoClass(type):
    instance = []

    def __new__(mcs, name, bases, dct):
        return super(MemoClass, mcs).__new__(mcs, name, bases, dct)

    def __init__(cls, name, bases, dct):
        super(MemoClass, cls).__init__(name, bases, dct)
        pass

    def __call__(cls, *args, **kwds):
        s = type.__call__(cls, *args, **kwds)
        cls.instance.append(s)
        return s

    def print_instance(self):

        print("\nInstances of : ", self.__name__, " - size : ", self.instance.__len__())

        for inst in self.instance:
            inst.who()

        pass

    def free_instance(self, cls):

        print("\nFree instance : ")
        cls.who()

        if cls in self.instance:
            self.instance.remove(cls)

        pass


class MemoObject(object, metaclass=MemoClass):


    def __init__(self, name):
        self.name = name

    def who(self):
        print("class : ", self.__class__.__name__, " - name : ", self.name)

    def free(self):
        self.__class__.free_instance(self)


class Person(MemoObject):
	instance = []

    def __init__(self, name):
        super().__init__(name)


class Animal(MemoObject):
	instance = []

    def __init__(self, name):
        super().__init__(name)


print("Main")

MemoObject.print_instance()

m1 = MemoObject("M1")
print("\nM1 : ")
m1.who()

MemoObject.print_instance()

m2 = MemoObject("M2")
print("\nM2 : ")
m2.who()

MemoObject.print_instance()

m1.free()

print("PERSON")

MemoObject.print_instance()
Person.print_instance()

p1 = Person("P1")
print("\nP1 : ")
p1.who()

MemoObject.print_instance()
Person.print_instance()
Animal.print_instance()

a1 = Animal("A1")
print("\nA1 : ")
a1.who()

MemoObject.print_instance()
Person.print_instance()
Animal.print_instance()

