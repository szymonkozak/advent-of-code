defmodule Aoc2_2 do
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
      [first, second, letter, password] ->
        at_first = String.at(password, String.to_integer(first) - 1)
        at_second = String.at(password, String.to_integer(second) - 1)
        at_first != at_second && (at_first == letter || at_second == letter)
      _ -> false
    end
  end
end
