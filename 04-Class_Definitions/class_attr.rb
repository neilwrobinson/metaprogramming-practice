class MyClass
    attr_accessor :a
end

obj = MyClass.new
obj.a = 2
p obj.a

class MyClass
    class << self       #add singleton method
        attr_accessor :c
    end
end

MyClass.c = 'It works!'
p MyClass.c

p MyClass.singleton_methods