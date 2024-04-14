require 'test/unit'
require_relative 'checked_attributes'

# use checked_attributes module instead of Kernel

class Person
    include CheckedAttributes

    attr_checked :age do |v|
        v >= 18
    end
end

class TestCheckedAttribute < Test::Unit::TestCase

    def setup 
        @bob = Person.new        
    end

    def test_accepts_valid_values
        pp @bob.public_methods.grep(/^a/)
        puts "Person Class Methods: "
        pp Person.methods.grep(/^a/)
        @bob.age = 20
        assert_equal 20, @bob.age
    end

    def test_refuses_invalid_values
        assert_raises RuntimeError, 'Invalid attribute' do
            @bob.age = 17
        end
    end
end
