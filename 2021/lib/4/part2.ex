defmodule Aoc4_2 do
  def solve(input) do
    [chosen | boards] = parse(input)

    Enum.reduce(chosen, {boards, 0}, fn current, {boards, score} ->
      boards = mark(boards, current)

      if winner = Enum.find(boards, &is_winner?(&1)) do
        boards = Enum.reject(boards, &is_winner?(&1))
        {boards, unmarked_sum(winner) * current}
      else
        {boards, score}
      end
    end)
    |> elem(1)
  end

  defp mark(boards, current) do
    Enum.map(boards, fn board ->
      Enum.map(board, fn line ->
        Enum.map(line, &if(&1 == current, do: nil, else: &1))
      end)
    end)
  end

  defp is_winner?(board) do
    all_marked?(board) or all_marked?(Enum.zip_with(board, & &1))
  end

  defp all_marked?(line) do
    Enum.any?(line, &(Enum.uniq(&1) == [nil]))
  end

  defp unmarked_sum(winner) do
    winner
    |> List.flatten()
    |> Enum.filter(& &1)
    |> Enum.sum()
  end

  defp parse(input) do
    [chosen | boards] =
      input
      |> File.read!()
      |> String.split("\n\n")

    chosen_numbers =
      chosen
      |> String.split(",")
      |> Enum.map(&String.to_integer(&1))

    boards_numbers =
      boards
      |> Enum.map(&String.split(&1, "\n"))
      |> Enum.map(fn board ->
        Enum.map(board, &String.split/1)
        |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
      end)

    [chosen_numbers | boards_numbers]
  end
end
