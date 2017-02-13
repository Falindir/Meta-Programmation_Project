class MemoClass(type):

    def __new__(mcs, name, bases, dct):
        s = super(MemoClass, mcs).__new__(mcs, name, bases, dct)
        s.instances = []
        return s

    def __init__(cls, name, bases, dct):
        super(MemoClass, cls).__init__(name, bases, dct)
        pass

    def __call__(cls, *args, **kwds):
        s = type.__call__(cls, *args, **kwds)
        cls.instances.append(s)
        return s

    def print_instance(self):

        print("\nInstances de ", self.__name__, " (taille ", self.instances.__len__(),") : ")

        for inst in self.instances:
            inst.who()

        pass

    def free_instance(self, cls):

        print("\nFree : ")
        cls.who()

        if cls in self.instances:
            self.instances.remove(cls)

        pass


class MemoObject(object, metaclass=MemoClass):

    def __init__(self, name):
        self.name = name

    def who(self):
        print("class : ", self.__class__.__name__, " - name : ", self.name)

    def free(self):
        self.__class__.free_instance(self)


class Person(MemoObject):

    def __init__(self, name):
        super().__init__(name)


class Animal(MemoObject):

    def __init__(self, name):
        super().__init__(name)


