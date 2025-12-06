defmodule Aoc2_2 do
  def solve(input) do
    File.read!(input)
    |> String.split("\n")
    |> Enum.map(&read_game/1)
    |> Enum.map(fn {_, power} -> power end)
    |> Enum.sum()
  end

  def read_game(game) do
    [_ | tl] = String.split(game, ["Game ", ": "])

    [[game_id] | games] =
      tl
      |> Enum.flat_map(&String.split(&1, "; "))
      |> Enum.map(&String.split(&1, ", "))

    %{"blue" => blue, "red" => red, "green" => green} =
      games
      |> Enum.map(&check_round/1)
      |> Enum.reduce(%{"blue" => 0, "red" => 0, "green" => 0}, fn round, acc ->
        Map.update(acc, "blue", round["blue"], &max(&1, round["blue"]))
        |> Map.update("red", round["red"], &max(&1, round["red"]))
        |> Map.update("green", round["green"], &max(&1, round["green"]))
      end)

    power = blue * red * green

    {String.to_integer(game_id), power}
  end

  defp check_round(round) do
    Enum.map(round, &String.split(&1, " "))
    |> Enum.map(fn [number, color] -> {String.to_integer(number), color} end)
    |> Enum.reduce(%{"blue" => 0, "red" => 0, "green" => 0}, fn {number, color}, acc ->
      Map.update(acc, color, number, &max(&1, number))
    end)
  end
end
