require "awesome_print"

data = { :now => Time.now, :class => Time.now.class, :distance => 42e42 }
ap data, :indent => -2  # <-- Left align hash keys.