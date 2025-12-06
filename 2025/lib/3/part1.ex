defmodule Aoc3_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.reduce(0, fn bank, sum ->  joltage(bank) + sum end)
  end

  defp joltage(bank) do
    bank = String.graphemes(bank) |> Enum.map(&String.to_integer/1)

    {first, index} =
      Enum.drop(bank, -1)
      |> Enum.with_index()
      |> Enum.max_by(fn {digit, _index} -> digit end)

    second = Enum.drop(bank, index + 1) |> Enum.max()
    first * 10 + second
  end
end
