defmodule Aoc3_1 do
  def solve(input) do
    [path_a, path_b] =
      input
      |> File.read!()
      |> String.split("\n")
      |> Enum.map(&prepare_path/1)

    board_a = fill_board(path_a)
    board_b = fill_board(path_b)

    MapSet.intersection(board_a, board_b)
    |> MapSet.delete({0, 0})
    |> Enum.map(&manhattan_to_center/1)
    |> Enum.min()
  end

  defp manhattan_to_center({x, y}), do: abs(x) + abs(y)

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
      Enum.reduce(instructions, {{0, 0}, MapSet.new()}, fn instruction, acc ->
        move(instruction, acc)
      end)

    filled_board
  end

  defp move({direction, distance}, {{x, y}, board}) do
    updated_board = MapSet.put(board, {x, y})

    new_position =
      case direction do
        :R -> {x + 1, y}
        :L -> {x - 1, y}
        :U -> {x, y + 1}
        :D -> {x, y - 1}
      end

    case distance do
      x when x > 0 -> move({direction, distance - 1}, {new_position, updated_board})
      _ -> {{x, y}, board}
    end
  end
end
