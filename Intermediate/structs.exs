# Structs are extensions built on top of maps that provide compile-time checks and default values.
# Structs are the closest to the c-style struct  constructs but instead of defining types/variables
# we define key value pairs and also provide defaults for them.

# We define a struct byt using the defstruct macro and passing a keyword list of default values
defmodule User do
  defstruct name: 'John Doe', age: 26, email: 'jdoe@email.com', role: :admin
end

# Structs take the name of the module they’re defined in.
# In the example above, we defined a struct named User.

# You create a new instance of the User struct just like you would a map but with the name after the %
a_user = %User{}
puts a_user
# => %User{name: 'John Doe', age: 26, email: 'jdoe@email.com', role: :admin}
another_user = %User{name: 'jane'}
# => %User{name: 'jane', age: 26, email: 'jdoe@email.com', role: :admin}

a_user = %{a_user | age: 35}
# => %User{name: 'John Doe', age: 35, email: 'jdoe@email.com', role: :admin}

# You cannot add any new key that is not defined in the struct otherwise it throws a
# (KeyError)

# structs can also be pattern matched
%User{name: name} = a_user
puts name

# if we dont define a default it assumes nil

# We can also make keys not optional
defmodule Car do
  @enforce_keys [:make]
  defstruct [:model, :make]
end