defmodule Aoc3_2 do
  def solve(input) do
    [path_a, path_b] =
      input
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(&prepare_path/1)

    board_a = fill_board(path_a)
    board_b = fill_board(path_b)

    intersections = find_intersections(board_a, board_b)

    Enum.zip(
      intersection_steps_count(intersections, board_a),
      intersection_steps_count(intersections, board_b)
    )
    |> Enum.map(fn {a, b} -> a + b end)
    |> Enum.min()
  end

  defp find_intersections(board_a, board_b) do
    MapSet.intersection(
      MapSet.new(board_a, fn {x, y, _} -> {x, y} end),
      MapSet.new(board_b, fn {x, y, _} -> {x, y} end)
    )
    |> MapSet.delete({0, 0})
  end

  defp intersection_steps_count(intersections, board) do
    MapSet.to_list(board)
    |> Enum.filter(fn {x, y, _} -> Enum.member?(intersections, {x, y}) end)
    |> Enum.sort()
    |> Enum.map(fn {_, _, steps} -> steps end)
  end

  defp prepare_path(line) do
    String.split(line, ",")
    |> Enum.map(&deconstruct/1)
  end

  defp deconstruct(instruction) do
    case String.graphemes(instruction) do
      [direction | distance] ->
        {
          String.to_atom(direction),
          String.to_integer(List.to_string(distance))
        }
    end
  end

  defp fill_board(instructions) do
    {_, filled_board} =
      Enum.reduce(instructions, {{0, 0, 0}, MapSet.new()}, fn instruction, acc ->
        move(instruction, acc)
      end)

    filled_board
  end

  defp move({direction, distance}, {{x, y, steps}, board}) do
    updated_board = MapSet.put(board, {x, y, steps})

    {updated_x, updated_y} =
      case direction do
        :R -> {x + 1, y}
        :L -> {x - 1, y}
        :U -> {x, y + 1}
        :D -> {x, y - 1}
      end

    case distance do
      x when x > 0 ->
        move({direction, distance - 1}, {{updated_x, updated_y, steps + 1}, updated_board})

      _ ->
        {{x, y, steps}, board}
    end
  end
end
