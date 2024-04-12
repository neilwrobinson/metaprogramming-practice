# using an object instead of a class
module MyModule
    def my_method; 'Hello'; end
end

obj = Object.new

class << obj
    include MyModule
end

p obj.my_method
p obj.singleton_methods