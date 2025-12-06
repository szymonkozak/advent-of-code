defmodule Aoc2_1 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&read_game/1)
    |> Enum.filter(fn {_, games} -> Enum.all?(games, & &1) end)
    |> Enum.map(&String.to_integer(elem(&1, 0)))
    |> Enum.sum()
  end

  def read_game(game) do
    [_ | tl] = String.split(game, ["Game ", ": "])

    [[game_id] | games] =
      tl
      |> Enum.flat_map(&String.split(&1, "; "))
      |> Enum.map(&String.split(&1, ", "))

    rounds =
      games
      |> Enum.flat_map(&check_round/1)

    {game_id, rounds}
  end

  defp check_round(round) do
    Enum.map(round, &String.split(&1, " "))
    |> Enum.map(fn [number, color] -> {String.to_integer(number), color} end)
    |> Enum.map(&possible_round?/1)
  end

  defp possible_round?({number, color}) do
    case color do
      "red" -> number <= 12
      "green" -> number <= 13
      "blue" -> number <= 14
    end
  end
end
