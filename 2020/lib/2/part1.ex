defmodule Aoc2_1 do
  def solve(input) do
    input
    |> read_lines
    |> Enum.count(&is_valid?(&1))
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  defp is_valid?(input) do
    case String.split(input, ["-", " ", ": "]) do
      [min, max, letter, password] ->
        min = String.to_integer(min)
        max = String.to_integer(max)
        password
        |> count_letters(letter)
        |> in_range?(min..max)
      _ -> false
    end
  end

  defp count_letters(password, letter) do
    password
    |> String.graphemes()
    |> Enum.count(&(&1 == letter))
  end

  defp in_range?(number, min..max) do
    Enum.member?(min..max, number)
  end
end
