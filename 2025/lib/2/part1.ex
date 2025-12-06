defmodule Aoc2_1 do
  def solve(input) do
    File.read!(input)
    |> String.split(",")
    |> Enum.map(&parse_range/1)
    |> Enum.reduce(0, fn {first, second}, invalid_ids_sum ->
      first..second
      |> Enum.filter(&invalid_id?/1)
      |> Enum.sum()
      |> then(&(invalid_ids_sum + &1))
    end)
  end

  defp invalid_id?(id) do
    Integer.digits(id)
    |> split_in_half()
    |> then(fn {h1, h2} -> h1 == h2 end)
  end

  defp split_in_half(list) do
    len = round(length(list) / 2)
    Enum.split(list, len)
  end

  defp parse_range(range) do
    [first, second] = String.split(range, "-")
    {String.to_integer(first), String.to_integer(second)}
  end
end
