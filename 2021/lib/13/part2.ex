defmodule Aoc13_2 do
  def solve(input, opts \\ [print: true]) do
    {paper, instructions} = parse(input)

    instructions
    |> Enum.reduce(paper, &fold/2)
    |> draw()
    |> then(fn d -> if opts[:print], do: IO.puts(d), else: d end)
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

    instructions = parse_instructions(instructions)
    {paper, instructions}
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

  defp draw(paper) do
    {max_x, _} = Enum.max_by(paper, fn {x, _} -> x end)
    {_, max_y} = Enum.max_by(paper, fn {_, y} -> y end)

    Enum.map_join(0..max_y, "\n", fn y ->
      Enum.map_join(0..max_x, "", fn x ->
        if MapSet.member?(paper, {x, y}), do: "#", else: " "
      end)
    end)
  end
end
