s1, s2 = "abc", "def"

s1.instance_eval do             #standard meaning of instance eval is: "I want to change self."
    def swoosh!; reverse; end
end

p s1.swoosh!
p s1.singleton_methods
p s2.respond_to?(:swoosh!) 