class C
    def public_method
        self.private_method
    end

    private
    def private_method
        false
    end
end

p C.new.public_method