defmodule Aoc1_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&parse_instruction/1)
    |> Enum.reduce({0, 50}, fn {direction, distance}, {zeros_sum, current_pos} ->
      pos =
        case direction do
          :R -> rem(current_pos + distance, 100)
          :L ->
           v = rem(current_pos - distance, 100)
           if v < 0, do: 100 + v, else: v
        end

      {zeros_sum + if(pos == 0, do: 1, else: 0), pos}
    end)
    |> elem(0)
  end

  defp parse_instruction(line) do
    direction = String.at(line, 0) |> String.to_atom()
    distance = String.slice(line, 1..-1//1) |> String.to_integer()
    {direction, distance}
  end
end
