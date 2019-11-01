# behaviours and callbacks are a way to standardize and enforce a consistent public user facing API if required.
# in Java this is achieved using interfaces.

# Many libraries like plug use behaviours to enforce a common api people can use


# Lets create a behaviour module

defmodule Parser do
  @callback parse(String.t)::{:ok, term} | {:error, String.t}
  @callback extensions()::[atom()]
end


defmodule JSONParser do
  @behaviour Parser

  def parse(str), do: {:ok, "some json" <> str}
  def extensions(), do: [:json]
end

defmodule SVParser do
  @behaviour Parser

  def parse(str), do: {:ok, "some sv" <>str}
  def extensions(), do: [:csv, :tsv]
end

defmodule YAMLParser do
  @behaviour Parser

  def parse(str), do: {:ok, "some yaml" <> str}
  def extensions(), do: [:yaml]
end

# if one of the methods defined by the behaviour module is not defined,
#  by a module using it, a compile error will be thrown

defmodule SillyParser do
  @behaviour Parser

  def parse(_str), do: {:ok, "silly Parser I am"}
end
# warning: function extensions/0 required by behaviour Parser is not implemented (in module SillyParser)
# /Users/appfolio/Devspace/elixir-start-here/Intermediate/behaviors_and_callbacks.exs:39
