module MyModule
    def my_method
        42
    end
end

unbound = MyModule.instance_method(:my_method)
p unbound.class

# you cannot call an unbound method. But you can find it to an object with UnboundMethod#bind.

String.send :define_method, :another_method, unbound # Dynamic Dispatch on define_method because it's a private method

p "abc".another_method




