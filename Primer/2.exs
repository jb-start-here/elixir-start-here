# COLLECTIONS

# List, tuples, keywords, maps and functional combinators.

# This is a list
things = [:banana,true,"elements"]
IO.puts things[1]

# Elixir implements list as linked lists. 
# This means accessing the list length is an O(n) operation. 
# For this reason, it is typically faster to prepend than append

# ++ is the concat operator and -- is the delete operator
nums = ['a','b','c','d'] # A list
nums = ['z'] ++ nums         # ['z','a','b','c','d']
nums = nums ++ ['z']         # ['z','a','b','c','d','z'] 0(n) operation
nums = nums -- ['b','c','d'] # ['z','a','z']
nums = nums -- ['f']         # ['z','a','z']
nums = nums ++ ['q','w','a'] -- ['a','z']  # ['z','a','z','q','w'] duplicate deletes are idempotent here. 

# two inbuilt methods -> 'hd' and 'tl' give the head(first element) and tail(rest of the elements) of a list
IO.puts hd nums
IO.puts tl nums


[heads|tails] = nums
IO.puts heads
IO.puts tails


# In addition to the aforementioned functions, 
# you can use pattern matching and the cons operator | to split a list into head and tail. 
# More about pattern matching incoming.

# They are tuples. Misleading name. They are just like lists except they are enclosed in curly braces
# it is advisable to only hold three or four data elements in a tuple otherwise, use a list instead
tup = {3.14,"pie","apple","cherry"}
IO.puts tup