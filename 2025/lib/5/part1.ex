defmodule Aoc5_1 do
  def solve(input) do
    {ranges, ids} = parse(input)

    ids
    |> Enum.filter(fn id -> Enum.any?(ranges, &Enum.member?(&1, id)) end)
    |> Enum.count()
  end

  defp parse(input) do
    [ranges, ingredients] =
      File.read!(input)
      |> String.split("\n\n")

    ranges =
      ranges
      |> String.split("\n")
      |> Enum.map(&String.split(&1, "-"))
      |> Enum.map(fn [a, b] -> String.to_integer(a)..String.to_integer(b) end)

    ids =
      ingredients
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)

    {ranges, ids}
  end
end
