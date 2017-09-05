# Elixir also provides ranges represented like 3..5 which runs from 3 to 5 ends inclusive
Enum.map(1..10_000,&(&1 + 10))
# Returns [11,12,13,14,15......10_010]
# You can also use _ instead of a comma to represent large numbers for readability


# We have worked with the Enum module and they are eager...
# When you have a chain of Enum methods the data being passed into each new mthod is a computed value
# from the previous methods.

# the Stream module methods are like Enum methods except that theyre lazy
# In a chain of Stream methods, the data being passed into them is actually a computation that isnt computed until the time 
# its actually needed like forexample the last chain link
# It's useful while handling files,network files or potentially large / infinite data structures