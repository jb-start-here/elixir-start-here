# Lets use the default Enum function to use firstclass function

defmodule Sample.Utils do
  def square(n) do
    n*n
  end
  def sum(a,b) do
    a+b
  end


  # anonymous function test
  def anon_test(a,f) do
    f.(a)
  end
end


# '&' is the reference to squaring function and pass in the arity too
IO.puts Enum.map([1,2,3,4,5], &Sample.Utils.square/1)

# using anonymous functions
IO.puts Enum.map([1,2,3,4,5], fn(x) -> x*x end)

Sample.Utils.anon_test("test string", fn(x) -> IO.puts x end)

# Use f.(arg) if you want to call an anonymous function from a fucniton!