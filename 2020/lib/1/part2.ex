defmodule Aoc1_2 do
  def solve(input) do
    input
    |> read_lines
    |> Enum.map(&String.to_integer/1)
    |> find_2020
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  def find_2020(list) do
    [result | _] = for x <- list, y <- list, z <- list, x + y + z == 2020, do: x * y * z
    result
  end
end
