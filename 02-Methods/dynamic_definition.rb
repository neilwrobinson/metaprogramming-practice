class MyClass
    define_method :my_method do |my_arg|
        my_arg * 3
    end
end

obj = MyClass.new
p obj.my_method(3)

# or use send

p obj.send(:my_method, 3)

:x.class    # => Symbol
"x".class   # => String