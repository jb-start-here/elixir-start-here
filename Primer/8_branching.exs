# Branching logic
# There are 3 types od branching keywords if, cond, case

# if ...else construct

defmodule Sample do
  def first(list) do
    if(length(list) == 0) do
      nil
    else
      hd list
    end
  end

  def abbreviator(day) do
    cond do
      day == :monday -> "M"
      day == :tuesday -> "Tu"
      day == :wednesday -> "We"
      day == :thursday -> "Th"
      day == :friday -> "F"
      day == :saturday -> "Sa"
      day == :sunday -> "Su"
      true -> "Invalid Day"
    end
  end

  def abbreviator2(day) do
    case day do
      :tuesday -> "Tu"
      :monday -> "M"
      :wednesday -> "We"
      :thursday -> "Th"
      :friday -> "F"
      :saturday -> "Sa"
      :sunday -> "Su"
      _ -> "Invalid Day"
    end
  end


  # Another great use of pattern matching
  def day_describer(date) do
    case date do
      # The order of these statements do matter
      # It executes the first match
      {1,_,_} -> "Brand New Month"
      {25,12,_} -> "Merry Christmas"
      {25,month,_} -> "Only #{12-month} months till Christmas from this date!!"
      {1,1,_} -> "Happy New Year"
      {_,_,_} -> "Average day..."
    end
  end

end

import IO, only: [puts: 1]
puts Sample.first [1,2,3,4]
puts Sample.first []
puts Sample.abbreviator :thursday
puts Sample.abbreviator :caturday
puts Sample.abbreviator2 :caturday
puts Sample.abbreviator2 :monday
puts Sample.day_describer {25,12,2016}
puts Sample.day_describer {25,3,2016}
puts Sample.day_describer {21,2,1233}

