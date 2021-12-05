defmodule Aoc3_1 do
  def solve(input) do
    freqs =
      File.read!(input)
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.map(fn row ->
        Enum.map(row, &String.to_integer/1)
      end)
      |> Enum.zip_with(&Enum.frequencies(&1))

    calculate_rate(freqs, :gamma) * calculate_rate(freqs, :epsilon)
  end

  defp calculate_rate(freqs, type) do
    freqs
    |> Enum.map(fn freq ->
      if (type == :gamma and freq[1] > freq[0]) or
           (type == :epsilon and freq[1] < freq[0]),
         do: "1",
         else: "0"
    end)
    |> Enum.join()
    |> String.to_integer(2)
  end
end
