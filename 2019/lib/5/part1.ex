defmodule Aoc5_1 do
  def solve(input) do
    input
    |> File.read!()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> execute(0)
  end

  def execute(instructions, offset) do
    case Enum.at(instructions, offset) do
      1 -> execute(instructions, offset, &Kernel.+/2)
      2 -> execute(instructions, offset, &Kernel.*/2)
      99 -> instructions
    end
  end

  def execute(instructions, offset, operation) do
    execute(calculate_new_list(instructions, offset, operation), offset + 4)
  end

  def calculate_new_list(instructions, offset, operation) do
    List.replace_at(
      instructions,
      Enum.at(instructions, offset + 3),
      operation.(
        Enum.at(instructions, Enum.at(instructions, offset + 1)),
        Enum.at(instructions, Enum.at(instructions, offset + 2))
      )
    )
  end
end
