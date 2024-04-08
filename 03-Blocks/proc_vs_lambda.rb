def double(callable_object)
    callable_object.call * 2
end

l = lambda { return 10 }
p double(l)

def another_double
    p = Proc.new { return 10 }
    result = p.call
    return result * 2 # unreachable code!
end

p another_double # => 10

#steer clear of buggy code like this
#pr = Proc.new { return 10 }
#p double(pr)

# can be fixed by
pr2 = Proc.new { 10 }
p double(pr2)