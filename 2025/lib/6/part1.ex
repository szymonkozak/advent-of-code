defmodule Aoc6_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.zip_with(& &1)
    |> Enum.map(&Enum.reverse/1)
    |> Enum.reduce(0, fn [op | problems], acc ->
      values = Enum.map(problems, &String.to_integer/1)
      acc + if(op == "*", do: Enum.product(values), else: Enum.sum(values))
    end)
  end
end
