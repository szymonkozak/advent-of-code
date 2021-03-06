defmodule Aoc1_1 do
  def solve(input) do
    input
    |> read_lines
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&compute_fuel/1)
    |> Enum.sum()
    |> IO.inspect()
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  defp compute_fuel(mass) do
    div(mass, 3) - 2
  end
end
