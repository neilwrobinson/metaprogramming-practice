# dynamic dispatch on the duplicate.rb class
require_relative 'DS'

class Computer
    def initialize(computer_id, data_source)
        @id = computer_id
        @data_source = data_source
        data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
    end

    def self.define_component(name)
        define_method(name) do
            info = @data_source.send "get_#{name}_info", @id
            price = @data_source.send "get_#{name}_price", @id
            result = "#{name.capitalize}: #{info} ($#{price})"
            return "* #{result}" if price >= 100
            result
        end
    end

    # remove via introspection (introspecting data_source)
    #define_component :mouse
    #define_component :cpu
    #define_component :keyboard

end

my_computer = Computer.new(42, DS.new)
p my_computer.mouse
p my_computer.cpu
p my_computer.keyboard
p my_computer.display