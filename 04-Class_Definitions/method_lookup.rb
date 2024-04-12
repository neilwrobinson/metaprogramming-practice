class C
    def a_method
        'C#a_method()'
    end

    class << self
        def a_class_method
            'C.a_class_method()'
        end
    end
end

class D < C; end

obj = D.new
p obj.a_method

# obj -> Class D -> superclass C (a_method) -> Object
p D.ancestors

class << obj
    def a_singleton_method
        'obj#a_singleton_method()'
    end
end

p obj.singleton_class.superclass

# obj -> obj#a_singleton_method -> Class D -> superclass C (a_method) -> Object
#        ^                     ^
#        |                     |
#        |                     |

# Singleton Classes and Method Look up
# 

obj = Object.new
p obj.singleton_class


# ancestors
puts "singleton_classes and superclasses"
p C.singleton_class
p D.singleton_class
p D.singleton_class.superclass
p C.singleton_class.superclass

# The end resuult is you can call a class method on a subclass, for instance:
p D.a_class_method

