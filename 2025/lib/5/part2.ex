defmodule Aoc5_2 do
  def solve(input) do
    parse(input)
    |> Enum.sort_by(& &1.first)
    |> Enum.reduce([], fn
      range, [] -> [range]
      range, [prev | rest] ->
        if Range.disjoint?(prev, range),
          do: [range, prev | rest],
          else: [prev.first..max(prev.last, range.last) | rest]
    end)
    |> Enum.map(&Range.size/1)
    |> Enum.sum()
  end

  defp parse(input) do
    [ranges, _] =
      File.read!(input)
      |> String.split("\n\n")

    ranges
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "-"))
    |> Enum.map(fn [a, b] -> String.to_integer(a)..String.to_integer(b) end)
  end
end
