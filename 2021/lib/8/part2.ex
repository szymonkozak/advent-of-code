defmodule Aoc8_2 do
  def solve(input) do
    parse(input)
    |> Enum.map(fn [signal_patterns, output_values] ->
      mappings = map_signals(signal_patterns)

      sorted_chars(output_values)
      |> Enum.map(fn value -> Enum.find_index(mappings, &(&1 == value)) end)
      |> Enum.join()
    end)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end

  defp sorted_chars(input) do
    input
    |> String.split()
    |> Enum.map(fn s ->
      String.to_charlist(s) |> Enum.sort()
    end)
  end

  defp map_signals(input) do
    chars = sorted_chars(input)

    [d1] = by_length(chars, 2)
    [d4] = by_length(chars, 4)
    [d7] = by_length(chars, 3)
    [d8] = by_length(chars, 7)

    six_segmented = by_length(chars, 6)
    five_segmented = by_length(chars, 5)

    d0 = Enum.find(six_segmented, &Enum.empty?((d8 -- &1) -- d4 -- d7))
    d6 = Enum.find(six_segmented, &(&1 != d0 && length(&1 -- d1) == 5))
    d9 = Enum.find(six_segmented, &(&1 not in [d6, d0]))
    d5 = Enum.find(five_segmented, &Enum.empty?(&1 -- d6))
    d3 = Enum.find(five_segmented, &(&1 != d5 && length(d9 -- &1) == 1))
    d2 = Enum.find(five_segmented, &(&1 not in [d3, d5]))

    [d0, d1, d2, d3, d4, d5, d6, d7, d8, d9]
  end

  defp by_length(chars, length) do
    Enum.filter(chars, &(length(&1) == length))
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " | "))
  end
end
