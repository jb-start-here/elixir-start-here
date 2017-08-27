# BASICS

# Elixir is a dynamic, functional, scalable, fault-tolerant programming language

# Most of the language basic syntax and 
# features are very intuitive except for a few caveats and special design choices

# A brief overview of the less obvious syntax and features

IO.puts "hello world" # print statement, uses UTF-8 encoding, supports all escape characters like \n, \t and such

IO.puts 0b0010 # inbuilt binary support ->2
IO.puts 0o644  # inbuilt octal support ->420
IO.puts 0x1F   # inbuilt hexa support ->31
IO.puts 1.2e-1 # inbuilt exponential support ->.12 (the number before e has to be a float)
IO.puts true   # inbuilt boolean support. everything is truthy except false and nil ->true

# atoms 
# An atom is a constant whose name is their value. 
# If you’re familiar with Ruby these are synonymous with Symbols
IO.puts :name  
# Most identifiers are symbols...I mean atoms. including true or false boolean values.
IO.puts :true == true # ->true


# Special operators to watch out for
# |> - is a pipe operator in elixir
IO.puts :symbol |> is_atom # prints true
IO.puts :anothername |> is_boolean # prints false
IO.puts :true |> is_boolean # prints true

# is_atom and is_boolean are standard elixir library methods
IO.puts is_atom(:name) # also prints true


# Modules are a way to organize and namespace methods/functions in elixir.
# length is a method from the String module in elixir lang
IO.puts String.length("The quick brown fox jumps over the lazy dog") # prints 43


# IO.puts is a method called puts in IO module_info
# Just like ruby all method calls are parenthesis optional
IO.puts(String.length "The quick brown fox jumps over the lazy dog") # prints 43


# Elixir supports basic operations like &&, ||, !, and, or, not, +, -, /, *,==, !=, ===, !==, <=, >=, < and >. 
# and, or, not operators only take boolean as their left arg
# '/' operator only returns floats. use div() and rem() to return integers
IO.puts 3+4*4 # prints 19
IO.puts 2/1 # prints 2.0
IO.puts div(2,1) # prints 2
IO.puts rem(2,1) # prints 0

# An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting.
IO.puts :hello > 999 # prints true
IO.puts {:hello, :world} > [1, 2, 3] # prints false
# comparison order -> number < atom < reference < function < port < pid < tuple < map < list < bitstring


# Strings can be interpolated like in ruby
name = "elixir"
IO.puts "hello #{name}"
# Strings can be concatenated using '<>' operator
IO.puts "hello " <> name