# Protocols are a mechanism to achieve polymorphism in Elixir. 
# Dispatching on a protocol is available to any data type as long as 
# it implements the protocol

# Example -> any module or an entity implementing the `enumerable` protocol must be compatible with the 
# Enum module or a derivative of it.

# for example if we were to design a series of data structures that has an internal size variable that always
# keeps the current sizde of the data structure, we can define a size protocol and all data strucutres implement it


defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

# The Size protocol expects a function called size that receives one argument 
# (the data structure we want to know the size of) to be implemented.
# We can now implement this protocol for the data structures that would have a compliant implementation:

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end


Size.size %{one: "one"}
# => 1
Size.size {:ok, :not_found, :redirect}
# => 3
Size.size "moon"
# => 4

# Another example of a protocol is an Enum. Enum.map knows what to do
# when different datastrucutres are passed to it
