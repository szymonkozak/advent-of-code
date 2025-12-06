defmodule Aoc1_2 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&parse_instruction/1)
    |> Enum.reduce({50, 0}, fn {direction, distance}, {pos, zeros_count} ->
      dir = if direction == :R, do: 1, else: -1

      Enum.reduce(1..distance, {pos, zeros_count}, fn _, {pos, zeros_count} ->
        pos = rem(pos + dir, 100)
        zeros_count = if pos == 0, do: zeros_count + 1, else: zeros_count
        {pos, zeros_count}
      end)
    end)
    |> elem(1)
  end

  defp parse_instruction(line) do
    direction = String.at(line, 0) |> String.to_atom()
    distance = String.slice(line, 1..-1//1) |> String.to_integer()
    {direction, distance}
  end
end
