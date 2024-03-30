require_relative 'DS'

class Computer < BasicObject
    def initialize(computer_id, data_source)
        @id = computer_id
        @data_source = data_source
    end

    def method_missing(name)
        super if !@data_source.respond_to?("get_#{name}_info")
        info = @data_source.send "get_#{name}_info", @id
        price = @data_source.send "get_#{name}_price", @id
        result = "#{name.capitalize}: #{info} ($#{price})"
        return "* #{result}" if price >= 100
        result
    end
end

my_computer = Computer.new(42, DS.new)

# puts my_computer.respond_to?(:mouse) # => false (cannot run because it is inheriting from BasicObject)

class Computer
    #override respond_to_missing? every time to keep respond_to? from "Lying"
    # if inheriting from BasicObject, you won't have the respond_to? method.
    #def respond_to_missing?(method, include_private = false)
    #    @data_source.respond_to?("get_#{method}_info") || super
    #end
end

p my_computer.cpu
p my_computer.mouse
p my_computer.display
p Object.instance_methods.grep /^d/ # a method called :display will be in inherited from Object Class. 
                                    # inherit from BasicObject as a "Blank Slate"
puts "Computer's methods:"
p Computer.instance_methods 
puts "BasicObject's methods"
p BasicObject.instance_methods