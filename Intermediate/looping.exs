# Just like any good functional programming language, looping isnt done
# in a traditional way. We use a recursive method. This is done so that 
# elixir can maintain immutable data structure

defmodule SimpleLooping do
  # looping through an array and printing each element
  def loop([head|tail]) do
    IO.puts head
    loop tail
  end

  def loop([]) do
  end
end

SimpleLooping.loop([1,2,3,4,5,6,7,8,9,0])

defmodule SimpleMapFunction do
  def map([head|tail], hook) do
    hook.(head)
    map(tail,hook)
  end

  def map([], hook) do
  end

end

SimpleMapFunction.map([5,4,3,2,1], fn(x) -> IO.puts x+10 end)

defmodule Fibonacci do
  def fibo(n) when n == 0 or n == 1, do: n
  def fibo(n), do: fibo(n-1) + fibo(n-2) # Needs tail-call optimization
end


IO.puts(Fibonacci.fibo 6)

# elixir idiomatic approach
defmodule Fibonacci2 do
  def fibo(a, b, n) do
      case n do
          0 -> a
          _ -> fib(b, a+b, n-1)
      end
  end
end
