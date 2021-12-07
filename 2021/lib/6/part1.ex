defmodule Aoc6_1 do
  def solve(input) do
    initial = parse(input)

    Enum.reduce(1..80, initial, fn _, state ->
      Enum.flat_map(state, fn t -> if t == 0, do: [6, 8], else: [t - 1] end)
    end)
    |> length
  end

  defp parse(input) do
    File.read!(input)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
