def setup(&setup)
    setup.call
end
def event(description)
    puts "ALERT: #{description}" if yield
end

load '03-Blocks\redflag_1\events.rb'
load '03-Blocks\redflag_1\events2.rb'