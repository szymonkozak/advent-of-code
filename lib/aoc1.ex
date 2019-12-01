defmodule Aoc1 do
  def solve(input) do
    input
    |> read_lines
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&compute_fuel/1)
    |> Enum.sum()
    |> IO.inspect()
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  defp compute_fuel(mass) do
    compute_fuel(mass, 0)
  end

  defp compute_fuel(mass, current_fuel) do
    case div(mass, 3) - 2 do
      fuel when fuel > 0 -> compute_fuel(fuel, current_fuel + fuel)
      _ -> current_fuel
    end
  end
end

Aoc1.solve("../input1.txt")
