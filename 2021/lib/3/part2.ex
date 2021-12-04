import Utils

defmodule Aoc3_2 do
  def solve(input) do
    bits =
      input
      |> read_lines
      |> Enum.map(&String.graphemes/1)
      |> Enum.map(fn row ->
        Enum.map(row, &String.to_integer/1)
      end)

    calculate_rate(bits, :oxygen, 0) * calculate_rate(bits, :co2, 0)
  end

  defp calculate_rate(bits, _type, _index) when length(bits) == 1 do
    bits
    |> List.first()
    |> Enum.join()
    |> String.to_integer(2)
  end

  defp calculate_rate(bits, type, index) do
    freq =
      bits
      |> Enum.map(&Enum.at(&1, index))
      |> Enum.frequencies()

    freq_of_1 = Map.get(freq, 1, 0)
    freq_of_0 = Map.get(freq, 0, 0)

    required =
      if (type == :oxygen and freq_of_1 >= freq_of_0) or
           (type == :co2 and freq_of_1 < freq_of_0),
         do: 1,
         else: 0

    bits
    |> Enum.filter(&(Enum.at(&1, index) == required))
    |> calculate_rate(type, index + 1)
  end
end
