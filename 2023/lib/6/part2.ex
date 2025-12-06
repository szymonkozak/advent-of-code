defmodule Aoc6_2 do
  def solve(time, distance) do
    count_different_ways_to_beat(time, distance)
  end

  def count_different_ways_to_beat(time, distance) do
    1..time
    |> Enum.map(fn t -> (time - t) * t end)
    |> Enum.filter(fn d -> d > distance end)
    |> Enum.count()
  end
end
