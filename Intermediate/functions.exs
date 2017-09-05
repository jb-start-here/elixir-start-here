# In Elixir and many functional languages, functions are first class citizens.
# We will learn about the types of functions in Elixir, what makes them different, and how to use them.

# Anomymous functions
sum = fn(x, y) -> x + y end
# we invoke anon functions by using the dot notation
IO.puts sum.(5, 6)

# in elxir anon functions are so common that there is a shorthand notation for doing it.
sum2 = &(&1 + &2)
# where '&' is the capture operator
IO.puts sum2.(5, 6)
# here &1 and &2 are forst and second parameters


# Pattern matching is a way to implement method overloading
# Guard clauses is an augmentation to the pattern matching
# anon functions can also have pattern matching

handle_result = fn
  {:ok, result} -> IO.puts "the result is " <> Integer.to_string result
  {:error, _} -> IO.puts "Error: unknown."
  _ -> IO.puts "Invalid input."
end

handle_result.({:ok, 55})
handle_result.({:error,"5"})
handle_result.([1,2,3,4,5])

# Named function 

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

# if a named function has one line, we can shorten it with do:
defmodule Sample do
  def greet(name), do: "Hello, " <> name
end

defmodule Sample.Next do
  def greet_2(name) when is_bitstring(name), do: "Helloooo " <> name
  def greet_2(name) when is_bitstring(name) !== true, do: "strange name..."
end


IO.puts Sample.greet "joel"
IO.puts Sample.Next.greet_2 {:ok, 'go'}

#  We can also capture functions using the familiar capture operator '&'

fun = &Enum.map/2
another_fun = &Sample.greet/1

IO.puts another_fun.("j03L")
