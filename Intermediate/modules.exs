# modules namespace and organize functions

defmodule Sample do
  def random_method do
    
  end
end

#  we can also nest the modules

defmodule Sample.test do
  def another_random_method do
    
  end
end

Sample.test.another_random_method();

# model attributes are a way to store common data/constants in modules that 
# can be shared amongst themselves

defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    "#{@greeting} #{name}."
  end
end

# It is important to note there are reserved attributes in Elixir. The three most common are:

# moduledoc — Documents the current module.
# doc — Documentation for functions and macros.
# behaviour — Use an OTP or user-defined behaviour.