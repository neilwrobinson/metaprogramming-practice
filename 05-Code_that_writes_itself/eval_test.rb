require 'test/unit'

class Person; end


    def add_checked_attribute(klass, attribute)

        eval "
            class #{klass}
                def #{attribute}()
                    @#{attribute}
                end

                def #{attribute}=(value)
                    raise 'Invalid attribute' unless value
                    @#{attribute} = value
                end
            end
        "
    end



class TestCheckedAttribute < Test::Unit::TestCase

    def setup 
        add_checked_attribute(Person, :age)
        @bob = Person.new
        
    end

    def test_accepts_valid_values
        pp @bob.public_methods.grep(/^a/)
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
