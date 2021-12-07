defmodule Aoc7_1 do
  def solve(input) do
    positions = parse(input)
    {min, max} = Enum.min_max(positions)
    Enum.map(min..max, &fuel(positions, &1))
    |> Enum.min()
  end

  defp fuel(positions, target) do
    Enum.map(positions, &abs(&1 - target))
    |> Enum.sum()
  end

  defp parse(input) do
    File.read!(input)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
