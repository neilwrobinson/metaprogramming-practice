require 'test/unit'

class Person; end

# add block for validation

def add_checked_attribute(klass, attribute, &validation)
    klass.class_eval do         
        define_method attribute do
            instance_variable_get "@#{attribute}"
        end

        define_method "#{attribute}=" do |value|
            raise 'Invalid attribute' unless validation.call(value)
            instance_variable_set("@#{attribute}", value)
        end
    end
end



class TestCheckedAttribute < Test::Unit::TestCase

    def setup 
        add_checked_attribute(Person, :age) {|v| 
        v >= 18 
        }
        @bob = Person.new        
    end

    def test_accepts_valid_values
        pp @bob.public_methods.grep(/^a/)
        @bob.age = 20
        assert_equal 20, @bob.age
    end

    def test_refuses_invalid_values
        assert_raises RuntimeError, 'Invalid attribute' do
            @bob.age = 17
            pp @bob.validation
        end
    end
end
