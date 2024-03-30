require "pry"

pry = Pry.new
pry.memory_size = 101
p pry.memory_size 
#pry.quiet = true

pry.refresh(:memory_size => 90, :quiet => false)