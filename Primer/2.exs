# COLLECTIONS

# List, tuples, keywords, maps and functional combinators.

# This is a list
things = [:banana,true,"elements"]



# Elixir implements list as linked lists. 
# This means accessing the list length is an O(n) operation. 
# For this reason, it is typically faster to prepend than append

# ++ is the concat operator and -- is the delete operator
nums = [1,2,3,4,5,6,7,8] # A list
nums = [0] ++ nums       # [0,1,2,3,4,5,6,7,8]
nums = nums ++ [9]       # [0,1,2,3,4,5,6,7,8,9] 0(n) operator
nums = nums -- [4,5,6]   # [0,1,2,3,7,8,9]
nums = nums -- [34]      # [0,1,2,3,7,8,9]
nums = nums -- [1,2,2]   # [0,3,7,8,9] duplicate deletes are idempotent here. 
                         # The first matching element is only removed

# two inbuilt methods -> 'hd' and 'tl' give the head and tail of a list
IO.puts hd nums
IO.puts tl nums
