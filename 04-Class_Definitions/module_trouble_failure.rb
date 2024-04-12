# define a class methods in modules

module MyModule
    def self.my_method; 'hello'; end
end

class MyClass
    include MyModule
end

# MyClass.my_method # NoMethodError
puts "No singleton methods"
p MyClass.singleton_methods

module MyModuleSolution
    def my_method; 'hello'; end     #remove self.
end

class MyClass
    class << self
        include MyModuleSolution    # class extension
    end
end

puts "Solution add a class extension using Class << self: "
p MyClass.my_method
p MyClass.singleton_methods

obj = "Adding my_method to String object"

obj.instance_eval do
    class << self
        include MyModuleSolution
    end
end

puts "-----------------------"
puts "After instance_eval do"
p obj.my_method
p obj.singleton_methods

# Or 

