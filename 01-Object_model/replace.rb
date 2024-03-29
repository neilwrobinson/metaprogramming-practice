require 'test/unit'

def replace(array, original, replacement)
    array.map {|e| e == original ? replacement : e }
end

class ToTestReplace < Test::Unit::TestCase
    def test_replace
        original = ['one', 'two', 'one', 'three']
        replaced = replace(original, 'one', 'zero')
        assert_equal ['zero', 'two', 'zero', 'three'], replaced
    end
end

class Array
    def substitute(original, replacement) #monkeypatch
        self.map {|e| e == original ? replacement : e }
    end
end

class ToTestReplace_open_class_Array < Test::Unit::TestCase
    def test_replace
        original = ['one', 'two', 'one', 'three']
        replaced = original.substitute('one', 'zero')
        assert_equal ['zero', 'two', 'zero', 'three'], replaced
    end
end