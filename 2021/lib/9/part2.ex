defmodule Aoc9_2 do
  def solve(input) do
    heightmap = parse(input)
    width = length(Enum.at(heightmap, 0))
    heights = List.flatten(heightmap)
    all_basins_size = heights |> Enum.reject(&(&1 == 9)) |> length()

    low_points =
      heights
      |> low_points(width)
      |> Enum.map(fn {_, index} -> index end)

    initial_basins(low_points)
    |> fill_round(low_points, width, heights, all_basins_size)
    |> Map.values()
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.reduce(&Kernel.*/2)
  end

  defp initial_basins(low_points) do
    Enum.zip(low_points, low_points)
    |> Map.new()
    |> Map.put(:visited, MapSet.new())
  end

  defp low_points(heights, width) do
    heights
    |> Enum.with_index()
    |> Enum.filter(fn {height, index} ->
      adjacents(heights, index, width)
      |> Enum.all?(fn {_, adj} -> height < adj end)
    end)
  end

  defp fill_round(basins, basin_numbers, width, heights, all_basins_size) do
    basins =
      Enum.reduce(basin_numbers, basins, fn basin_label, basins ->
        Map.filter(basins, fn {_, label} -> label == basin_label end)
        |> Map.keys()
        |> Enum.reduce(basins, fn index, basins ->
          fill_adjacents(basins, index, basin_label, heights, width)
        end)
      end)

    if map_size(basins) < all_basins_size + 1 do
      fill_round(basins, basin_numbers, width, heights, all_basins_size)
    else
      basins
    end
  end

  defp fill_adjacents(basins, index, basin_label, heights, width) do
    if Map.get(basins, :visited) |> MapSet.member?(index) do
      basins
    else
      visited = Map.get(basins, :visited)
      basins = Map.put(basins, index, basin_label)

      adjacents(heights, index, width)
      |> Enum.reduce(basins, fn {index, value}, basins ->
        if value != 9, do: Map.put(basins, index, basin_label), else: basins
      end)
      |> Map.put(:visited, MapSet.put(visited, index))
    end
  end

  defp adjacents(heights, index, width) do
    len = length(heights)
    left = if rem(index, width) > 0, do: {index - 1, Enum.at(heights, index - 1)}, else: nil
    right = if rem(index + 1, width) > 0, do: {index + 1, Enum.at(heights, index + 1)}, else: nil
    up = if index - width >= 0, do: {index - width, Enum.at(heights, index - width)}, else: nil
    down = if index + width < len, do: {index + width, Enum.at(heights, index + width)}, else: nil

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
