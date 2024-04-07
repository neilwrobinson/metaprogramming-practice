module Kernel
    def with (resourse)
        begin
            yield
        ensure
            resourse.disposed
        end
    end
end