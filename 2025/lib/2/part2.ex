defmodule Aoc2_2 do
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

  def invalid_id?(id) when id <= 10, do: false

  def invalid_id?(id) do
    digits = Integer.digits(id)
    max_chunk_size = max(1, ceil(length(digits) / 2))

    1..max_chunk_size
    |> Enum.reduce_while(false, fn chunk_size, invalid? ->
      invalid? = digits
      |> Enum.chunk_every(chunk_size)
      |> Enum.uniq()
      |> length()
      |> then(&(invalid? or (&1 == 1)))

      if invalid? do
        {:halt, invalid?}
      else
        {:cont, invalid?}
      end
    end)

  end

  defp parse_range(range) do
    [first, second] = String.split(range, "-")
    {String.to_integer(first), String.to_integer(second)}
  end
end
