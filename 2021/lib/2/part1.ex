defmodule Aoc2_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [dir, value] -> {dir, String.to_integer(value)} end)
    |> calculate_positions()
    |> calculate_result()
  end

  defp calculate_positions(steps) do
    Enum.reduce(steps, {0, 0}, fn {direction, value}, {x, y} ->
      case direction do
        "forward" -> {x + value, y}
        "up" -> {x, y - value}
        "down" -> {x, y + value}
      end
    end)
  end

  defp calculate_result({x, y}), do: x * y
end
