module StringExtensions
    refine String do
        def to_alphanumeric
            gsub(/[^\w\s]/,'')
        end
    end
end

#p "my *1st* refinement!".to_alphanumeric # Error undefined method


using StringExtensions #Must use using <refinement name>

p "my *1st* refinement!".to_alphanumeric
