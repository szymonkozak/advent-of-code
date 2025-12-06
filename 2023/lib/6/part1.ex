defmodule Aoc6_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(&Enum.drop(&1, 1))
    |> Enum.zip_with(fn n -> Enum.map(n, &String.to_integer/1) end)
    |> Enum.map(&count_different_ways_to_beat/1)
    |> Enum.product()
  end

  def count_different_ways_to_beat([time, distance]) do
    1..time
    |> Enum.map(fn t -> (time - t) * t end)
    |> Enum.filter(fn d -> d > distance end)
    |> Enum.count()
  end
end
