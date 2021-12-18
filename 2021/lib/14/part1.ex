defmodule Aoc14_1 do
  def solve(input) do
    {template, rules} = parse(input)
    Stream.iterate(template, &transform(&1, rules))
    |> Enum.at(10)
    |> String.codepoints()
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.min_max()
    |> then(fn {min, max} -> max - min end)
  end

  defp transform(template, rules) do
    template
    |> String.codepoints()
    |> Enum.chunk_every(2, 1)
    |> Enum.flat_map(fn
      [a, b] -> [a, rules[Enum.join([a, b])]]
      x -> x
    end)
    |> Enum.join()
  end

  def parse(input) do
    [template | rules] =
      File.read!(input)
      |> String.split("\n", trim: true)

    splitted_rules =
      Map.new(rules, fn rule ->
        String.split(rule, " -> ")
        |> List.to_tuple()
      end)

    {template, splitted_rules}
  end
end
