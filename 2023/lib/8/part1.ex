defmodule Aoc8_1 do
  def solve(input) do
    {instructions, network} = parse(input)

    Stream.cycle(instructions)
    |> Enum.reduce_while({0, "AAA"}, fn instruction, acc ->
      {count, current_node} = acc
      {l, r} = Map.get(network, current_node)

      case current_node do
        "ZZZ" ->
          {:halt, count}

        _ ->
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
end
