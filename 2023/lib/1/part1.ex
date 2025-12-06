defmodule Aoc1_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&extract_numbers/1)
    |> Enum.map(&(List.first(&1) * 10 + List.last(&1)))
    |> Enum.sum()
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
