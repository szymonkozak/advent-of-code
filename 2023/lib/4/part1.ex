defmodule Aoc4_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&read_card/1)
    |> Enum.map(&calculate_score/1)
    |> Enum.sum()
  end

  defp read_card(line) do
    [_, winning, drawn] = String.split(line, [": ", " | "], trim: true)
    winning_numbers = parse_numbers(winning)
    drawn_numbers = parse_numbers(drawn)

    {winning_numbers, drawn_numbers}
  end

  defp calculate_score({winning_numbers, drawn_numbers}) do
    found =
      MapSet.intersection(
        MapSet.new(winning_numbers),
        MapSet.new(drawn_numbers)
      )
      |> MapSet.size()

    floor(:math.pow(2, found - 1))
  end

  defp parse_numbers(numbers) do
    numbers
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
