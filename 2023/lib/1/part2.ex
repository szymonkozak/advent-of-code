defmodule Aoc1_2 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&replace_first_and_last_text/1)
    |> Enum.map(&extract_numbers/1)
    |> Enum.map(&(List.first(&1) * 10 + List.last(&1)))
    |> Enum.sum()
  end

  def replace_first_and_last_text(line) do
    numbers = [
      {"one", "1"},
      {"two", "2"},
      {"three", "3"},
      {"four", "4"},
      {"five", "5"},
      {"six", "6"},
      {"seven", "7"},
      {"eight", "8"},
      {"nine", "9"}
    ]

    updated =
      ~r/(1|2|3|4|5|6|7|8|9|one|two|three|four|five|six|seven|eight|nine)/
      |> Regex.replace(line, "[\\1]", global: false)

    updated =
      numbers
      |> Enum.reduce(updated, fn {word, number}, s -> String.replace(s, "[#{word}]", number) end)

    updated =
      ~r/(eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)/
      |> Regex.replace(updated |> String.reverse(), "[\\1]", global: false)
      |> String.reverse()

    numbers
    |> Enum.reduce(updated |> String.reverse(), fn {word, number}, s ->
      String.replace(s, "[#{String.reverse(word)}]", number)
    end)
    |> String.reverse()
  end

  def extract_numbers(line) do
    line
    |> String.graphemes()
    |> Enum.map(&to_number_or_nil(&1))
    |> Enum.reject(&is_nil(&1))
  end

  def to_number_or_nil(el) do
    case Integer.parse(el) do
      {num, ""} -> num
      _ -> nil
    end
  end
end
