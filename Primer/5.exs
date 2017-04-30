# A sample module


# there is an Enum module already written so we will namespace it in Enum
defmodule Sample.Enum do
  def first(list) do
    hd list
  end

  # underscore in the pattern matching matches the variable but discards it
  def first_2([head | _]) do
    head
  end

  # It mtches this function if an empty list is passed to it.
  def first_2([]) do
    nil
  end

  # shortcut way of defining those functions
  def f(list), do: hd list
  def f_2([head | _]), do: head
  def f_2([]), do: nil

end



# Test drive code for Sample.Enum module

IO.puts Sample.Enum.first [1,2,3,4]
IO.puts Sample.Enum.first_2 [:ok,2,3,4]
IO.puts Sample.Enum.first_2 []