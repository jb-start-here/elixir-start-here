# foo(bar(baz(new_function(other_function()))))

# is converted to   

# other_function() |> new_function() |> baz() |> bar() |> foo()

import IO, only: [puts: 1]
a = "Elixir rocks"
puts a |> String.split
puts a |> String.upcase |> String.split()
puts "elixir" |> String.ends_with?("ixir")