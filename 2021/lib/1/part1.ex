defmodule Aoc1_1 do
  def solve(input) do
    input
    |> read_lines
    |> Enum.map(&String.to_integer/1)
    |> count_increases()
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  def count_increases(depths) do
    depths
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end
end
