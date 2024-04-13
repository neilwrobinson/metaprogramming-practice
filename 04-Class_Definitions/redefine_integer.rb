module RedefineInteger
    refine Integer do
        alias_method :old_plus, :+
        def +(value)
            self.old_plus(value).old_plus(1)
        end
    end
end

using RedefineInteger

p 1 + 1 

class Integer
    alias_method :old_plus_second_version, :+

    def +(x)
        self.old_plus_second_version(x).old_plus_second_version(2)
    end
end

p 1 + 1