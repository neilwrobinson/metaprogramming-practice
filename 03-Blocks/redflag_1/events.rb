setup do
    puts "setting up sales amount"
    @sales = 1000 # pull from database for instance
end

event "an event that always happens" do
    true
end

event "an event that never happens" do
    false
end

event "Sales is > 500" do
    @sales > 500
end