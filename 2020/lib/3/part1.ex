defmodule Aoc3_1 do
  def solve(input) do
    input
    |> read_lines
    |> tl
    |> count_trees
  end

  defp read_lines(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
  end

  defp count_trees(rows) do
    {trees_count, _} =
      Enum.reduce(rows, {0, 3}, fn row, {current_sum, position} ->
        if is_tree?(row, position) do
          {current_sum + 1, position + 3}
        else
          {current_sum, position + 3}
        end
      end)

    trees_count
  end

  defp is_tree?(row, position) do
    String.at(row, rem(position, String.length(row))) == "#"
  end
end
