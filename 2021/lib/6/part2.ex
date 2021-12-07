defmodule Aoc6_2 do
  @end_day 256

  def solve(input) do
    parse(input)
    |> then(fn initial ->
      Enum.map(0..8, fn index -> Enum.count(initial, &(&1 == index + 1)) end)
    end)
    |> Stream.iterate(&modify/1)
    |> Enum.at(@end_day - 1)
    |> Enum.sum()
  end

  def modify(list) do
    Enum.map(0..8, fn index ->
      case index do
        8 -> Enum.at(list, 0)
        6 -> Enum.at(list, 0) + Enum.at(list, 7)
        _ -> Enum.at(list, index + 1)
      end
    end)
  end

  defp parse(input) do
    File.read!(input)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
