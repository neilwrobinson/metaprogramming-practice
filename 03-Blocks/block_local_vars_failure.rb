def just_yield
    yield
end

top_level_variable = 1

just_yield do
    p top_level_variable += 1
    p local_to_block = 1
end

p top_level_variable
# p local_to_block #error