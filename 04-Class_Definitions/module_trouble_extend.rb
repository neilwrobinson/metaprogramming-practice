module MyModule
    def my_method; 'Hello'; end
end

obj = Object.new
obj.extend MyModule
p obj.my_method


# Or

class MyClass
    extend MyModule
end

p MyClass.my_method