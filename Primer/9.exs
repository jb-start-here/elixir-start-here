# looping in elixir is done with recursion. Elixir does not have any for loop kind of deals anywhere
# Let's rewrite map function.


defmodule Sample.Enum do
  def map(list,f) do
    [f.(hd list) | map(tl list,f)]
  end
end