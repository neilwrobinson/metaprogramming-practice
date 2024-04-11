class MyClass
    @my_var = 1           # Class instance variable that happens to be named @my_var but defined in different scopes.

    def initialize
        # @my_var = 1000  # if this is not initialized @my_var will be nil for object.
    end

    def self.read         # Class method
        @my_var
    end

    def write
        @my_var = 2 
    end

    def read
        @my_var     
    end
end

obj = MyClass.new
p obj.read          # => nil
p obj.write         # => 2 (i.e. variable is now initialized)
p obj.read
puts "MyClass.read: "
p MyClass.read

obj2 = MyClass.new
p obj2.read         # to confirm understanding that the new object will be nil.
puts "MyClass.read: "
p MyClass.read