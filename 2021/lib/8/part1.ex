defmodule Aoc8_1 do
  def solve(input) do
    parse(input)
    |> Enum.flat_map(&String.split/1)
    |> Enum.count(&(String.length(&1) in [2, 4, 3, 7]))
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, " | ") |> Enum.at(1)))
  end
end
