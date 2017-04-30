# Guard Classes - for when you want even more complex conditioning than pattern matching

defmodule Sample.Sounds do

  # Guard clause actually determines which function is matched and run.

  # defaulr params with \\
  def generate_sound(thing \\ "object")
  def generate_sound(thing) when thing == "car", do: "Honk"
  def generate_sound(thing) when thing == "grenade", do: "Boom"
  def generate_sound(thing) when thing == "parrot", do: "Squawk"
  def generate_sound(thing), do: "Random Noise from #{thing}"
end



# tests
IO.puts Sample.Sounds.generate_sound "car"
IO.puts Sample.Sounds.generate_sound "grenade"
IO.puts Sample.Sounds.generate_sound "something"
IO.puts Sample.Sounds.generate_sound
