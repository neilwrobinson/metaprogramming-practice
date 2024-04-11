# create a class that inherit's from Array without using the keyword 'class' 

MyClass = Class.new(Array) do
    def my_method
        'Hello!'
    end
end

obj = MyClass.new
p obj.my_method
p MyClass.ancestors
p MyClass.name

