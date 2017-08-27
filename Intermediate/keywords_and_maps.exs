# A key word list is a list of 2 element tuples where in every tuple, one element is an atom
flight_controls = [{:throttle, '70%'}, {:pitch, 0}, {:yaw, 20}, {:altitude, 80000}]
# key word lists are still plain ol' elixir lists so we can use Enum or List module methods on a keyword list
# It has the same performance characteristics as that of a regular list that is O(n) lookup

# A little bit of syntactic sugar when it comes keyword lists
flight_controls_sweet = [throttle: '70%', pitch: 0, yaw: 20, altitude: 80000]

# Biggest use of a keyword list is to pass in options to functions hence we have another 
# syntactic sugar to keep us going
Some_module.some_function('arg1','arg2',[x: 5, y: 6, z: 9]) 
# Can also be written as 
Some_module.some_function 'arg1', 'arg2', x: 5, y: 6, z: 9
# “In general, when the keyword list is the last argument of a function, the square brackets are optional.”

# We can also specify a duplicate option multiple times unlike maps
Some_module.another_function 'arg1', x: 5, x: 7, x: 8, y: 3, z: 9

# We also have the Keyword module provided by elixir inroder to manipulate kewword lists

# Map: 