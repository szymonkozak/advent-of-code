defmodule Aoc11_2 do
  def solve(input) do
    octopuses = parse(input)

    Stream.iterate(1, &(&1 + 1))
    |> Enum.reduce_while({octopuses, 0}, fn step, {octopuses, all_flashes_number} ->
      octopuses = flash(octopuses)

      flashes_number =
        octopuses
        |> Enum.count(fn {_, energy} -> energy == 0 end)

      if flashes_number == 100 do
        {:halt, step}
      else
        {:cont, {octopuses, all_flashes_number + flashes_number}}
      end
    end)
  end

  defp flash(octopuses) do
    octopuses = Map.new(octopuses, fn {coords, energy} -> {coords, rem(energy + 1, 10)} end)

    initial_flashes =
      Enum.filter(octopuses, fn {_, energy} -> energy == 0 end)
      |> Enum.map(fn {coords, _} -> coords end)

    flash_adjacents(octopuses, initial_flashes, [])
  end

  defp flash_adjacents(octopuses, [], _), do: octopuses

  defp flash_adjacents(octopuses, _flashes, all_current_flashes) do
    adjacents_flashes =
      Enum.filter(octopuses, fn {coords, energy} ->
        energy == 0 and coords not in all_current_flashes
      end)
      |> Enum.map(fn {coords, _} -> coords end)

    octopuses = increase_adjacents_energy(octopuses, adjacents_flashes)
    flash_adjacents(octopuses, adjacents_flashes, all_current_flashes ++ adjacents_flashes)
  end

  defp increase_adjacents_energy(octopuses, flashes) do
    adjacents = find_adjacents(flashes)

    Map.new(octopuses, fn {coords, energy} ->
      increase_level = Enum.count(adjacents, &(&1 == coords))
      new_energy = if(energy != 0, do: rem(min(energy + increase_level, 10), 10), else: energy)
      {coords, new_energy}
    end)
  end

  def find_adjacents(coords) do
    Enum.flat_map(coords, fn {x, y} ->
      [{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {1, 1}, {-1, 1}, {-1, -1}, {1, -1}]
      |> Enum.map(fn {x_o, y_o} -> {x + x_o, y + y_o} end)
      |> Enum.filter(fn {x, y} -> x in 0..9 and y in 0..9 end)
    end)
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {line, row}, map ->
      String.codepoints(line)
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
      |> Map.new(fn {energy, col} -> {{col, row}, energy} end)
      |> Map.merge(map)
    end)
  end
end
