defmodule FiboSolver do
  
  def fibo_server(scheduler) do
    send scheduler, {:ready, self}
    receive do
      {:fib, n, client} ->
        send client, {:answer, n, fib_calc(n), self}
        fibo_server(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end
  
  
  def fibo_calc(0), do: 0
  def fibo_calc(1), do: 1
  def fibo_calc(n), do: fibo_calc(n-1) + fibo_calc(n-2)
end