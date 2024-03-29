module Printable
    def print 
        puts "Printable print"
    end

    def prepare_cover
    end
end

module Document
    def print_to_screen
        prepare_cover
        format_for_screen
        print
    end

    def format_for_screen
    end

    def print
        puts "Document print"
    end
end

class Book
    include Document
    include Printable
end

b = Book.new
b.print_to_screen #Uses Module print since the start of creation at (BasicObject, Kernel, Object) 
                  # and then Book inserts Document, and then Book inserts Printable in the ancestor chain.
                  # thus, when looking for the method print, it will look into Book and then Printable (which is finds and "sends" the method)

                  # [Book, Printable, Document, Object, Kernel, BasicObject]

p Book.ancestors

# To fix this "bug" i.e. to use Documents print function you need to use switch the order to push Printable up the ancestor chain

class Book2
    include Printable
    include Document
end

b2 = Book2.new
b2.print_to_screen
p Book2.ancestors
    