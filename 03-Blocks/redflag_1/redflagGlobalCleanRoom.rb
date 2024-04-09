# To remove "Global" Variables
# And add a "Cleanroom"
lambda {
    setups = []
    events = []

    Kernel.send :define_method, :setup do |&block|
        setups << block
    end

    Kernel.send :define_method, :event do |description, &block|
        events << {:description => description, :condition => block }
    end

    Kernel.send :define_method, :each_setup do |&block|
        setups.each do |setup|
            block.call setup
        end
    end

    Kernel.send :define_method, :each_event do |&block|
        events.each do |event|
            block.call event
        end
    end
}.call

load '03-Blocks/redflag_1/events.rb'

each_event do |event|
    env = Object.new             # add an object just to evaluate blocks inside.
    each_setup do |setup|
        env.instance_eval &setup # evaluate setup block
    end
    puts "ALERT: #{ event[:description] }" if env.instance_eval &(event[:condition])
end