defmodule Aoc3_2 do
  def solve(input) do
    lines = read_lines(input)

    [
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2}
    ]
    |> Enum.map(fn slope -> solve_slope(lines, slope) end)
    |> Enum.reduce(1, &*/2)
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  def solve_slope(lines, {x, y}) do
    lines
    |> Enum.take_every(y)
    |> tl
    |> count_trees(x)
  end

  defp count_trees(rows, x) do
    {trees_count, _} = Enum.reduce(rows, {0, x}, fn row, {current_sum, position} ->
      if is_tree?(row, position) do
        {current_sum + 1, position + x}
      else
        {current_sum, position + x}
      end
    end)
    trees_count
  end

  defp is_tree?(row, position) do
    String.at(row, rem(position, String.length(row))) == "#"
  end
end
