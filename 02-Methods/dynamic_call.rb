class MyClass
    def my_method(my_arg)
        my_arg * 2
    end
end

obj = MyClass.new
p obj.my_method(3)

# or use send

p obj.send(:my_method, 3)

:x.class    # => Symbol
"x".class   # => String