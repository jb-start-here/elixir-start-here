defmodule Parallel do
  def pmap(collection, fun) do
    parent_pid = self
    collection
      |> Enum.map(fn (element) -> 
          spawn_link fn -> send parent_pid, { self, fun.(element) } end
         end)
      |> Enum.map(fn (pid) ->
          receive do { ^pid, result } -> result end
         end)
  end
end