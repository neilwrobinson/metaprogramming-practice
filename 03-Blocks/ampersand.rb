def math(a,b)
    yield(a,b)
end

def do_math(a,b, &operation) # The real meaning of the & is this: 
                             # “I want to take the block that is passed 
                             # to this method and turn it into a Proc.”
    math(a, b, &operation)
end

p do_math(2,3) { |x, y| x * y } 

p do_math(2,3) { |x, y| x - y }
