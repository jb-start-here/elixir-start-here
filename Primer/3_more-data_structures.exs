# Some Data Structures.

some_list = [1,2,3,4]
some_tuple = {:agent,"john","smith"}

# A special type of list called key word list which is a list of two element tuple_size
key_word_list = [{:one,1},{:two,2},{:three,3}]
IO.puts key_word_list[:one]


# Map
some_map = %{
  1 => "one",
  :ok => "random_text",
  :atomic => 100000,
  "text" => "value"
}


IO.puts some_map[1]
IO.puts some_map["text"]
IO.puts some_map[:ok]

# maps entries with atoms as keys can be accessed with dot notation
IO.puts some_map.ok
IO.puts some_map.atomic