def setup(&block)
    @setups << block
end

def event(description, &block)
    @events << {:description => description, :condition => block }
end

@setups = [] # "Global" variable in 'disguise'
@events = [] # "Global" variable in 'disguise'
load '03-Blocks/redflag_1/events.rb'

@events.each do |event|
    @setups.each do |setup|
        setup.call
    end
    puts "ALERT: #{ event[:description] }" if event[:condition].call
end

