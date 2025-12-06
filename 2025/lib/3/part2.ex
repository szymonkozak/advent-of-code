defmodule Aoc3_2 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.reduce(0, fn bank, sum -> joltage(bank) + sum end)
  end

  defp joltage(bank) do
    bank = String.graphemes(bank) |> Enum.map(&String.to_integer/1)

    select_next(bank, -1, 1)
    |> Integer.digits()
    |> Enum.reverse()
    |> Integer.undigits()
  end

  defp select_next(_, _, 13), do: 0

  defp select_next(bank, index, iter) do
    {max, index} =
      Enum.drop(bank, -12 + iter)
      |> Enum.with_index()
      |> Enum.drop(index + 1)
      |> Enum.max_by(fn {digit, _index} -> digit end)

    select_next(bank, index, iter + 1) + max * 10 ** (iter - 1)
  end
end
