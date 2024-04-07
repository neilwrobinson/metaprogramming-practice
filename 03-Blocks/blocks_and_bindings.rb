def my_method
    x = 'Goodbye'
    yield('cruel')
end

x = "Hello"
my_method do |y|
    p "#{x}, #{y} world"
end

