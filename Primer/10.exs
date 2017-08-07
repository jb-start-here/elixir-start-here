# how to define your own custom infix operators...
# read here https://www.rodneyfolz.com/custom-infix-functions-in-elixir/
# you can only use \\, <-, |, ~>>, <<~, ~>, <~, <~>, <|>, <<<, >>>, |||, &&&, and ^^^. for infix operators
# as these operators are pre loaded in your parser before bootstrapping elixir with the lang/ kernel module


defmodule Infixing do
  def left <|> right do
    IO.puts "#{right} is before #{left}..."
  end
end

defmodule Test do
  import Infixing

  def do_infix do
    5 <|> 6
  end
end


Test.do_infix

'''
In summary:

Elixir’s infix operators are special-cased in the parser.
The Kernel module just implements them, but doesn’t do anything special, syntax-wise, itself.
You can implement behavior for unused operators that the parser knows about.
You can’t create new infix operators without recompiling Elixir from source.
'''