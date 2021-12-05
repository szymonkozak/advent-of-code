defmodule Aoc5_1 do
  def solve(input) do
    parse(input)
    |> Enum.reduce(%{}, &draw/2)
    |> Map.values()
    |> Enum.count(&(&1 > 1))
  end

  def draw([[x1, y1], [x2, y2]], matrix) do
    cond do
      x1 == x2 -> Enum.map(y1..y2, &{x1, &1})
      y1 == y2 -> Enum.map(x1..x2, &{&1, y1})
      true -> []
    end
    |> Enum.reduce(matrix, fn position, matrix ->
      Map.update(matrix, position, 1, &(&1 + 1))
    end)
  end

  def parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " -> "))
    |> Enum.map(fn points ->
      Enum.map(points, fn coords ->
        String.split(coords, ",")
        |> Enum.map(&String.to_integer/1)
      end)
    end)
  end
end
