defmodule Aoc6_2 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
    |> Enum.zip_with(& &1)
    |> Enum.map(&Enum.reject(&1, fn el -> el == " " end))
    |> Enum.chunk_by(&Enum.empty?/1)
    |> Enum.reject(&(&1 == [[]]))
    |> Enum.reduce(0, fn [first | rest], acc ->
      {op, f} = List.pop_at(first, -1)
      Enum.map([f | rest], fn c -> Enum.map(c, &String.to_integer/1) |> Integer.undigits() end)
      |> then(fn n -> acc + if(op == "*", do: Enum.product(n), else: Enum.sum(n)) end)
    end)
  end
end
