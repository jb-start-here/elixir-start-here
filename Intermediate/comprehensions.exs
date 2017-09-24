# List comprehensions are syntactic sugar for looping through 
# enumerables in Elixir. In this lesson we’ll look at how we can use 
# comprehensions for iteration and generation.

list = [1,2,3,4,5]
for x <- list do
  IO.puts x+10
end
for x <- list, do: x*x

# A comprehension is made of three parts
# 1. generator
# 2. filter
# 3. collectible

# example
require Integer
for n <- [1,2,3,4,5,6,7], do: Integer.is_even n

#  n <- [1,2,3,4,5] is a generator
#  You can also pattern match and left side of the generator operator `<-` can be any Enum
# {:ok, val} <-  [ok: "Hello", error: "Unknown", ok: "World"] generates ["Hello", "World"]

# Can also use multiple right generators
for n <- 1..5, p <- 1..3 do
  IO.puts "#{n} #{p}"  # total no of iterations is 5*3
end

# first variable can also be used in the secoind generator
for n <- 1..5, p <- 1..n do
  IO.puts String.duplicate("#{n}",p)
end

# Filters can be used to filer put elements from generator before `do` ing them
multiple_of_three? = fn (x) -> rem(x, 3) == 0 end
for n <- 0..9, multiple_of_three?.(n), do: n
# => [0,3,6,9]
#  you can slo pass in multiple filters


# comprehensions always return lists but you can also collect it a custom data structure
for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val * val}
# => %{"a" => 1, "b" => 4}
for <<c <- " Helloworld ">>, c != ?\s, into: "", do: <<c>>
# => "helloworld"