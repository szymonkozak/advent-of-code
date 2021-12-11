defmodule Aoc9_1 do
  def solve(input) do
    parse(input)
    |> low_points()
    |> Enum.map(fn {height, _} -> height + 1 end)
    |> Enum.sum()
  end

  defp low_points(heightmap) do
    width = length(Enum.at(heightmap, 0))
    heights = List.flatten(heightmap)

    heights
    |> Enum.with_index()
    |> Enum.filter(fn {height, index} ->
      adjacents(heights, index, width)
      |> Enum.all?(&(height < &1))
    end)
  end

  defp adjacents(heights, index, width) do
    left = if rem(index, width) > 0, do: Enum.at(heights, index - 1), else: nil
    right = if rem(index + 1, width) > 0, do: Enum.at(heights, index + 1), else: nil
    up = if index - width >= 0, do: Enum.at(heights, index - width), else: nil
    down = if index + width < length(heights), do: Enum.at(heights, index + width), else: nil
    [left, right, up, down] |> Enum.filter(& &1)
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(fn line ->
      String.codepoints(line)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
