# looping in elixir is done with recursion. Elixir does not have any for loop kind of deals anywhere
# Let's rewrite map function.

import IO, only: [puts: 1]

defmodule Sample.Enum do
  def map([], f) do # you can use pattern matching in this this case to handle termination cases
  # pattern matchin is useful in achieving method overloading and method polymorphism
  end
  def map(list,f) do
    [f.(hd list) | Sample.Enum.map(tl(list), f)]
  end
  # guard clauses is an augmentation to pattern matching... you can use advanced checkes to invoke 
  # methods based on conditions
  # for example; we could have implemented termination cases handling using


  # def map(list,f) when list.length == 0 do
  # end
end

Sample.Enum.map([1,2,3,4,5,6,7,8,9,0,:ok], fn(x) -> IO.puts x end)

# The Enum module.
# A set of algorithms for enumerating over enumerables. All collection except tuples are Enumerables.

# all? - applies a given function predicate against an entire list and 
# returns a boolean if every element satisfies the condition.
puts Enum.all?([1,2,3,4,5,6,7,8,:ok], fn(x) -> is_integer x end)
puts Enum.all?([1,2,3,4,5], fn(x) -> is_integer x end)

# any? - similar to all? but returns true if atleast one element satisfies the function
puts Enum.any? [1,2,3,4,5,:ok], fn(x) -> is_atom(x) end

# chunk - breaks up a enumerable into chunks of specified sizes
Enum.chunk_every([1, 2, 3, 4, 5, 6], 2) # =>[[1, 2], [3, 4], [5, 6]]
Enum.chunk_every([1, 2, 3, 4, 5, 6, 7], 2) # =>[[1, 2], [3, 4], [5, 6]]

# starts a new chunk everytime the fn output changes
Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(x) -> String.length(x) end) # => [["one", "two"], ["three"], ["four", "five"], ["six"]]

# applies fn every threee items
Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)
# => [1001, 2, 3, 1004, 5, 6, 1007, 8]


Enum.each([1,2,3,4,5], fn(x) -> IO.puts x end)
Enum.map([1,2,3,4,5], fn(x) -> IO.puts x end)

# other functions
# 1. Enum.min finds the min element
# 2. Enum.max finds max
# 3. Enum.sort/1 sorts an enumerable
# 4. Enum.sort/2 sorts an enumerable according to a comparator fn provided by us
Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
# 5. Enum.uniq removes duplicates


# With reduce/3 we can distill our collection down into a single value. 
# To do this we supply an optional accumulator (10 in this example) to be passed into our function; 
# if no accumulator is provided the first element in the enumerable is used:
puts Enum.reduce([1,2,3,4,5,6,7,8,9], fn(x,acc) -> x+acc end)


a = a: "some test"