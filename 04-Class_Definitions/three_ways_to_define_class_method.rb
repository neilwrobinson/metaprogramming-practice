# Three ways to define a class method:

def MyClass.a_class_method; end         # frowned upon by expert Rubyists

class MyClass
    def self.another_class_method; end  # 2nd takes advantage of the fact that self in the class definition is the class itself
end

class MyClass                           # 3rd the code opens the singleton class and defines the method in there.
    class << self                       # syntax acknowledges the singleton class explicity.
        def yet_another_class_method; end
    end
end
