import Utils

defmodule Aoc2_2 do
  def solve(input) do
    input
    |> read_lines
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [dir, value] -> {dir, String.to_integer(value)} end)
    |> calculate_positions()
    |> calculate_result()
  end

  defp calculate_positions(steps) do
    Enum.reduce(steps, {0, 0, 0}, fn {direction, value}, {x, y, aim} ->
      case direction do
        "forward" -> {x + value, y + value * aim, aim}
        "up" -> {x, y, aim - value}
        "down" -> {x, y, aim + value}
      end
    end)
  end

  defp calculate_result({x, y, _aim}), do: x * y
end
