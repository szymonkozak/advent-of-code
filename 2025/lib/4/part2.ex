defmodule Aoc4_2 do
  def solve(input) do
    board = parse(input)
    remove_papers(board)
  end

  defp remove_papers(board) do
    {sum, to_remove} =
      board
      |> Enum.reduce({0, %{}}, fn {{x, y}, value}, {sum, to_remove} ->
        if(value == "@" and length(adj_papers(board, {x, y})) < 4,
          do: {sum + 1, Map.put(to_remove, {x, y}, ".")},
          else: {sum, to_remove}
        )
      end)

    if(sum == 0, do: 0, else: remove_papers(Map.merge(board, to_remove)) + sum)
  end

  defp adj_papers(board, {x, y}) do
    [{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {1, 1}, {-1, 1}, {-1, -1}, {1, -1}]
    |> Enum.map(fn {x_o, y_o} -> {x + x_o, y + y_o} end)
    |> Enum.filter(fn {x, y} -> Map.has_key?(board, {x, y}) and board[{x, y}] == "@" end)
  end

  defp parse(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {line, row}, map ->
      String.graphemes(line)
      |> Enum.with_index()
      |> Map.new(fn {value, col} -> {{col, row}, value} end)
      |> Map.merge(map)
    end)
  end
end
