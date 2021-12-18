defmodule Aoc14_2 do
  def solve(input) do
    {template, rules} = parse(input)

    template
    |> String.codepoints()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.map(&Enum.join/1)
    |> Enum.frequencies()
    |> Stream.iterate(&calculate_pairs(&1, rules))
    |> Enum.at(40)
    |> Enum.reduce(%{}, fn {pair, usage}, usages ->
      letter = String.codepoints(pair) |> List.first()
      Map.update(usages, letter, usage, &(&1 + usage))
    end)
    |> Map.values()
    |> Enum.min_max()
    |> then(fn {min, max} -> max - min end)
    |> then(&(&1 - 1))
  end

  defp calculate_pairs(freqs, rules) do
    freqs
    |> Map.keys()
    |> Enum.reduce(freqs, fn pair, usages ->
      n = freqs[pair]
      insertion = rules[pair]
      [a, b] = String.codepoints(pair)
      new_a = [a, insertion] |> Enum.join()
      new_b = [insertion, b] |> Enum.join()

      Map.update!(usages, pair, &(&1 - n))
      |> Map.update(new_a, n, &(&1 + n))
      |> Map.update(new_b, n, &(&1 + n))
    end)
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
