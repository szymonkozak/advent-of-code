defmodule Aoc7_2 do
  def solve(input) do
    positions = parse(input)
    {min, max} = Enum.min_max(positions)
    Enum.map(min..max, &fuel(positions, &1))
    |> Enum.min()
  end

  defp fuel(positions, target) do
    Enum.map(positions, fn position ->
      n = abs(position - target)
      div((n * (n + 1)), 2)
    end)
    |> Enum.sum()
  end

  defp parse(input) do
    File.read!(input)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
