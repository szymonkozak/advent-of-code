defmodule Aoc8_2 do
  def solve(input) do
    {instructions, network} = parse(input)

    network
    |> Enum.filter(fn {node, _} -> String.ends_with?(node, "A") end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.map(fn starting ->
      solve_one(starting, network, instructions)
    end)
    |> Enum.reduce(&lcm/2)
  end

  defp solve_one(starting, network, instructions) do
    Stream.cycle(instructions)
    |> Enum.reduce_while({0, starting}, fn instruction, acc ->
      {count, current_node} = acc
      {l, r} = Map.get(network, current_node)

      if String.ends_with?(current_node, "Z") do
        {:halt, count}
      else
        case instruction do
          "L" -> {:cont, {count + 1, l}}
          "R" -> {:cont, {count + 1, r}}
        end
      end
    end)
  end

  defp parse(input) do
    [instructions, network] =
      File.read!(input)
      |> String.split("\n\n")

    instructions = String.codepoints(instructions)

    network =
      String.split(network, "\n")
      |> Enum.reduce(%{}, fn node_desc, acc ->
        [node, left, right] = String.split(node_desc, [" = ", "(", ", ", ")"], trim: true)
        Map.put(acc, node, {left, right})
      end)

    {instructions, network}
  end

  def gcd(a, 0), do: a
  def gcd(0, b), do: b
  def gcd(a, b), do: gcd(b, rem(a, b))

  def lcm(0, 0), do: 0
  def lcm(a, b), do: trunc(a * b / gcd(a, b))
end
