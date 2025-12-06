defmodule Aoc9_1 do
  def solve(input) do
    parse(input)
    |> Enum.map(&predict_next_value/1)
    |> Enum.sum()
  end

  defp predict_next_value(line) do
    Stream.cycle([1])
    |> Enum.reduce_while({[line], line}, fn _, {acc, line} ->
      new_line = Enum.zip_with(line, Enum.drop(line, 1), &(&2 - &1))
      acc = [new_line | acc]

      case Enum.all?(new_line, &(&1 == 0)) do
        true -> {:halt, acc}
        false -> {:cont, {acc, new_line}}
      end
    end)
    |> Enum.reduce(0, fn line, acc ->
      case Enum.all?(line, &(&1 == 0)) do
        true -> 0
        false -> List.last(line) + acc
      end
    end)
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
