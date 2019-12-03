defmodule Aoc2_1 do
  def solve(input) do
    input
    |> File.read!()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> process(0)
    |> Enum.at(0)
  end

  def process(list, offset) do
    case Enum.at(list, offset) do
      1 -> process(list, offset, &Kernel.+/2)
      2 -> process(list, offset, &Kernel.*/2)
      99 -> list
    end
  end

  def process(list, offset, operation) do
    process(calculate_new_list(list, offset, operation), offset + 4)
  end

  def calculate_new_list(list, offset, operation) do
    List.replace_at(
      list,
      Enum.at(list, offset + 3),
      operation.(
        Enum.at(list, Enum.at(list, offset + 1)),
        Enum.at(list, Enum.at(list, offset + 2))
      )
    )
  end
end
