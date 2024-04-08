v1 = 1
class MyClass       # SCOPE GATE: entering class
    v2 = 2
    puts "Print local variables inside MyClass: "
    p local_variables
    def my_method   # SCOPE GATE: entering def
        v3 = 3
        puts "Print local variables inside MyClass and my_method: "
        p local_variables
    end             # SCOPE GATE: leaving def
    puts "Print local variables inside MyClass and my_method and after my_method: "
    p local_variables
end                 # SCOPE GATE: leaving class

obj = MyClass.new
obj.my_method
puts "Print local variables after calling my_method on an object: "
p local_variables