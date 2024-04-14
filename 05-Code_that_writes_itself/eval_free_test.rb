require 'test/unit'

class Person; end

# use class_eval instead of a "string eval"

def add_checked_attribute(klass, attribute)
    klass.class_eval do # I used class_exec, and tests still passed, but I don't know why.
        
        define_method attribute do
            instance_variable_get "@#{attribute}"
        end

        define_method "#{attribute}=" do |value|
            raise 'Invalid attribute' unless value
            instance_variable_set("@#{attribute}", value)
        end
    end
end



class TestCheckedAttribute < Test::Unit::TestCase

    def setup 
        add_checked_attribute(Person, :age)
        @bob = Person.new
        
    end

    def test_accepts_valid_values
        pp @bob.public_methods.grep(/^a/)
        pp @bob.instance_variables
        #pp Kernel.public_methods.grep(/^a/)
        @bob.age = 20
        assert_equal 20, @bob.age
    end

    def test_refuses_nil_values
        assert_raises RuntimeError, 'Invalid attribute' do
            @bob.age = nil
        end
    end

    def test_refuses_false_values
        assert_raises RuntimeError, 'Invalid attribute' do
            @bob.age = false
        end
    end
end
