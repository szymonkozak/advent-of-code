defmodule Aoc13_1 do
  def solve(input) do
    {paper, instruction} = parse(input)

    fold(instruction, paper)
    |> Enum.count()
  end

  defp fold({dir, f}, paper) do
    MapSet.new(paper, fn dot ->
      case {dot, dir} do
        {d = {x, y}, "y"} -> if y < f, do: d, else: {x, 2 * f - y}
        {d = {x, y}, "x"} -> if x < f, do: d, else: {2 * f - x, y}
      end
    end)
  end

  defp parse(input) do
    [dots, _, instructions] =
      File.read!(input)
      |> String.split("\n")
      |> Enum.chunk_by(&(&1 == ""))

    paper =
      Enum.map(dots, fn d -> String.split(d, ",") |> Enum.map(&String.to_integer/1) end)
      |> Enum.map(&List.to_tuple/1)
      |> MapSet.new()

    instruction = parse_instructions(instructions) |> List.first()
    {paper, instruction}
  end

  defp parse_instructions(instructions) do
    Enum.map(
      instructions,
      &(String.split(&1, " ")
        |> List.last()
        |> String.split("=")
        |> List.to_tuple()
        |> then(fn {dir, value} -> {dir, String.to_integer(value)} end))
    )
  end
end
