def to_alphanumeric(s)
    s.gsub(/[^\w\s]/,'')
end
require 'test/unit'
class ToAlphanumbericTest < Test::Unit::TestCase
    def test_strip_non_alphanumeric_characters
        assert_equal '3 the Magic Number', to_alphanumeric('#3, the *Magic, Number*?')
    end
end


class String
    def to_alphanumeric
        gsub(/[^\w\s]/,'')
    end
end

class StringExtensionsTest < Test::Unit::TestCase
    def test_strip_non_alphanumeric_characters_on_String_class
        assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
    end
end