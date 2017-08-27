# Functions in Elixir are called methods and must be defined in a module - A logical grouping of similar functions

defmodule SomeModule do
  def say_here do
    IO.puts "here!"
  end
end
SomeModule.say_here

defmodule AnotherModule do
  # import all io methods into our AnotherModule module namespace.
  import IO
  # import only puts from IO. the 1 after puts atom is its arity
  # import IO, only: [puts: 1]

  # import all from IO except puts
  # import IO, except: [puts: 1]

  
  def say_here do
    puts "I'm here!"
  end
end
AnotherModule.say_here


# . notation can be used to namespace stuff

defmodule EnterpriseModule.Utils.AnimalSounds do
  import IO , only: [puts: 1]
  def cat do
    puts "meow"
  end
  def dog do
    puts "bork"
  end
  def pig do
    puts "oink"
  end
  def lion do
    puts "roar"
  end
end

defmodule EnterpriseModule.WrongUtils.AnimalSounds do
  import IO , only: [puts: 1]
  def cat do
    puts "bork"
  end
  def dog do
    puts "meow"
  end
  def pig do
    puts "roar"
  end
  def lion do
    puts "oink"
  end
end

defmodule EnterpriseModule do
  alias EnterpriseModule.Utils.AnimalSounds
  # alias can be used to alias modules into just its last names
  def test_method do
    AnimalSounds.pig
  end


  alias EnterpriseModule.Utils.AnimalSounds, as: Sounds
  alias EnterpriseModule.WrongUtils.AnimalSounds, as: WrongSounds

  def another_test do
    Sounds.pig
    WrongSounds.cat
  end

  # Every module also has a set of macros. they are not functions or methods. They are just blocks of code
  # Integer module has a macro called is_even.
  # macros cant be used in modules without requiring the module the macro belongs to
  require Integer
  def one_more_test(num) do
    IO.puts "The number #{num} is even? ans: #{Integer.is_even(num)}"
  end

  
end

EnterpriseModule.test_method # oink
EnterpriseModule.another_test # oink,bork
EnterpriseModule.one_more_test(5) # The number 5 is even? ans: false
EnterpriseModule.one_more_test 5 # parenthesis are optional for elixir method invocation